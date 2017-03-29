#!/bin/bash
rabbitmqctl set_policy ha-durable1 "^ha-durable1\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable2 "^ha-durable2\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable3 "^ha-durable3\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2", "rabbit@rabbitmq-node3"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable-all "^ha-durable-all\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2", "rabbit@rabbitmq-node3"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha1 "^ha1\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node4"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha2 "^ha2\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node4", "rabbit@rabbitmq-node5"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha3 "^ha3\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node4", "rabbit@rabbitmq-node5", "rabbit@rabbitmq-node6"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-all "^ha-all\." '{"ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node4", "rabbit@rabbitmq-node5", "rabbit@rabbitmq-node6"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable-lazy1 "^ha-durable-lazy1\." '{"queue-mode":"lazy","ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable-lazy2 "^ha-durable-lazy2\." '{"queue-mode":"lazy","ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable-lazy3 "^ha-durable-lazy3\." '{"queue-mode":"lazy","ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2", "rabbit@rabbitmq-node3"]}' --priority 1 --apply-to queues
rabbitmqctl set_policy ha-durable-lazy-all "^ha-durable-all\." '{"queue-mode":"lazy","ha-mode":"nodes","ha-params":["rabbit@rabbitmq-node1", "rabbit@rabbitmq-node2", "rabbit@rabbitmq-node3"]}' --priority 1 --apply-to queues
