#!/bin/bash

sudo docker stop container $(sudo docker ps -aq)
