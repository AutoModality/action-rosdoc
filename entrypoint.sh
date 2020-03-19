#!/bin/bash

docs_path=docs
src_path=${1:-"."}

source /opt/ros/melodic/setup.bash

rosdoc_lite -o $docs_path $src_path

echo ::set-output name=docs-path::$docs_path  
