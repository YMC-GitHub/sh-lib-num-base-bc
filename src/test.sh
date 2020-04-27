#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/index.sh"
source "$THIS_FILE_PATH/sh-lib-time-cost.sh"


function eq() {
  if [ "$1" = "a" ]; then
    echo "true"
  else
    echo "false"
  fi
}
function fn_noop(){
  echo ""
}
function fn_identify(){
  echo "$1"
}

function test() {
  local fn=
  local expectValue=
  local ouput=
  fn=${1}
  ouput=$(eval "$fn")
  expectValue=${2}
  echo "test:$fn"
  if [ "$ouput" = "$expectValue" ]; then
    echo "it is ok"
  else
    echo "it is false.expect $ouput = $expectValue"
  fi
}



#: <<simpe-usage
echo "test-进制转换："

function test_num_base_bc_10_to_xx(){
  local base=
  local i=
  local res=
  local s=
  local e=

  i=10
  base=2
  s=1
  e=32
  [ -n "$1" ] && base="$1"
  [ -n "$2" ] && s="$2"
  [ -n "$3" ] && e="$3"
echo "test-进制转换：10=>$base"
for  i in `seq $s $e`
do
res=$(num_base_bc_10_to_xx "$i" "$base")
echo "$i:$res"
done
}
#test_num_base_bc_10_to_xx "2" >> "$THIS_FILE_PATH/test.log.txt"
#test_num_base_bc_10_to_xx "8" >> "$THIS_FILE_PATH/test.log.txt"
#test_num_base_bc_10_to_xx "16" >> "$THIS_FILE_PATH/test.log.txt"
recordTime "bc.10.to.xx"
test_num_base_bc_10_to_xx "16"
caculateTime "bc.10.to.xx"


## file-usage
# ./src/test.sh