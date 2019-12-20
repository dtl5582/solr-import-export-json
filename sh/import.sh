#!/bin/bash
 
cd `dirname $0`
 
CUR_SHELL_DIR=`pwd`
CUR_SHELL_NAME=`basename ${BASH_SOURCE}`
 
JAR_NAME="import-export-1.0.jar"
JAR_PATH=$CUR_SHELL_DIR/$JAR_NAME

SOLR_SERVER="http://192.168.173.221:8983/solr/VDB"

JSON_NAME="neusoo-lz-20181009.json"
JSON_DIR=$CUR_SHELL_DIR/jsons
JSON_PATH=$JSON_DIR/$JSON_NAME

DATE=`date +%Y%m%d`
LOG_DIR=$CUR_SHELL_DIR/logs
LOG_PATH=$LOG_DIR/import_$DATE.log
 
nohup java -jar $JAR_PATH -s $SOLR_SERVER -a import -o $JSON_PATH  >> $LOG_PATH 2>&1 &
