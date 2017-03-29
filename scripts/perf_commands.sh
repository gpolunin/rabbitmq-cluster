#!/usr/bin/env bash
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -a
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable1.queue -s 1000 -C 500000
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable1.queue -s 1000 -C 500000 -f persistent
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -y0 -p -u ha-durable3.queue -s 1000 -C 500000 -f persistent
runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -c 10000 -f persistent -C 500000


bin/runjava com.rabbitmq.perf.PerfTest --uri "amqp://localhost:30022" -p -c 1000 -u ha-durable3.queue -s 1000 -C 500000 -f persistent

bin/runjava com.rabbitmq.perf.PerfTest --uri "amqp://localhost:30022" -y0 -p -u ha-durable1.queue -s 1000 -C 500000 -f persistent

bin/runjava com.rabbitmq.perf.PerfTest --uri "amqp://local-kube:30022" -c 10000 -f persistent -C 500000



bin/runjava com.rabbitmq.perf.PerfTest --uri "amqp://localhost:30022" -x10 -y5 -r 100 -R 100 -q 100 -p -c 1000 -u ha-durable3.queue -s 1000 -C 500000 -f persistent
bin/runjava com.rabbitmq.perf.PerfTest --uri "amqp://localhost:30022" -x5 -y5 -q 100 -p -c 1000 -u ha-durable1.queue -s 1000 -C 500000 -f persisten