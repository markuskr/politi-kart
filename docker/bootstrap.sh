#!/bin/bash

MIX_ENV=prod /usr/local/bin/mix phoenix.server >> /var/log/phoenix.log
