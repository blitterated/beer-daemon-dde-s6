#!/bin/sh
# echo out to STDERR
errcho () {
  echo $@ >&2
}

# set up a handler for TERM signal
cut_off () {
  errcho "WHADDYA MEAN I'M CUT OFF?"
  exit 0
}

trap cut_off TERM

# Wait for other services to start, but don't block signals.
for i in $(seq 1 3)
do
  sleep 1
done

# Drink!
for i in $(seq -s ' ' $BOTTLES -1 0)
do
  case "$i" in
    1) NUM_BOTTLES="1 bottle" ;;
    0) NUM_BOTTLES="No more bottles" ;;
    *) NUM_BOTTLES="$i bottles" ;;
  esac

  errcho "**CRASH!** $NUM_BOTTLES of beer on the wall, $NUM_BOTTLES of beer..."
  sleep 1
done

exit 0
