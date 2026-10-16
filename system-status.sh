#!/usr/bin/env bash
# Refreshing CPU, memory, and battery monitor for Linux.
set -u

read_cpu() {
  awk '/^cpu / { idle=$5; total=0; for(i=2;i<=NF;i++) total+=$i; print total, idle }' /proc/stat
}

read_mem() {
  awk '/MemTotal:/ {t=$2} /MemAvailable:/ {a=$2} END {
    if (t>0) printf "%.0f%% (%d/%d MiB)", (t-a)*100/t, (t-a)/1024, t/1024;
    else print "unavailable"
  }' /proc/meminfo
}

read_battery() {
  for f in /sys/class/power_supply/BAT*/capacity; do
    if [ -r "$f" ]; then
      printf "%s%%" "$(cat "$f")"
      return
    fi
  done
  printf "not detected (uptime: %s)" "$(uptime -p 2>/dev/null || uptime)"
}

while true; do
  set -- $(read_cpu)
  total1=${1:-0}; idle1=${2:-0}
  sleep 1
  set -- $(read_cpu)
  total2=${1:-0}; idle2=${2:-0}
  dt=$((total2-total1)); di=$((idle2-idle1))
  if [ "$dt" -gt 0 ]; then
    cpu=$((100 * (dt-di) / dt))
  else
    cpu=0
  fi

  clear
  printf '\033[1;36m╭──────────────────────────────────────╮\033[0m\n'
  printf '\033[1;36m│       P U L S E  /  S Y S T E M      │\033[0m\n'
  printf '\033[1;36m╰──────────────────────────────────────╯\033[0m\n\n'
  printf '  CPU usage : %s%%\n' "$cpu"
  printf '  RAM usage : %s\n' "$(read_mem)"
  printf '  Battery   : %s\n' "$(read_battery)"
  printf '  Updated   : %s\n' "$(date '+%H:%M:%S')"
  printf '\n  Refreshes every 2 seconds. Press Ctrl+C to quit.\n'
  sleep 1
done
