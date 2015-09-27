#!/bin/sh

cd /home/teeworlds/servers

update()
{
  #type=`grep "^sv_reset_file" servers/$1.cfg | tail -n1 | sed -e s"#.*types/\(.*\)/.*#\1#"`
  type=`grep "\[console\]: executing 'types/.*/flexvotes.cfg'" servers/$1.log | tail -n 1 | sed -e "s#.*\[console\]: executing 'types/\(.*\)/flexvotes.cfg'#\1#"`
  if [ -n "$type" ]; then
    echo "exec types/$type/flexname.cfg" > servers/$1.fifo
    sleep 0.2
    echo "clear_votes" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/flexvotes.cfg" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgaa" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgab" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgac" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgad" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgae" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgaf" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgag" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgah" > servers/$1.fifo
    sleep 0.2
    echo "exec types/$type/votes.cfgai" > servers/$1.fifo
  fi
}

for i in `cat all-servers`; do
  update $i &
done
