#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/sh-lib-stack.sh"

function num_base_bc_10_to_xx(){
  local decNumber=
  local base=
  local stack_name=
  local rem=
  local res=
  local dig_arr=

  stack_name="f2ab78"
  decNumber=10
  base=2
  [ -n "$1" ] && decNumber="$1"
  [ -n "$2" ] && base="$2"
  #echo -n 'num_base_bc_10_to_xx' | base64 | md5sum | cut -d ' ' -f1 | cut -c 1-6
  stack "$stack_name" >/dev/null 2>&1
  dig_arr=(0 1 2 3 4 5 6 7 8 9 A B C D E F)
  #echo "存入栈:"
  while [ $decNumber -gt 0 ]
  do
      # 取余
      rem=$[$decNumber%$base]
      # 存储
      stack_push "$stack_name" "$rem" >/dev/null 2>&1
      # 取商
      decNumber=$[$decNumber/$base]
  done
  #stack_size "$stack_name"
  #stack_print "$stack_name"
  #echo "取出栈:"
    while [ ! $(stack_is_empty "$stack_name") = "true" ]
    do

      #stack_is_empty "$stack_name"
      #stack_size "$stack_name"
      #fix:get val by $(stack_pop "$stack_name"),can't update stack
      key=$(stack_peek "$stack_name")
      # 重定向 标准输出到 /dev/null 且 标准错误等同于标准输出
      stack_pop "$stack_name" >/dev/null 2>&1
      val=${dig_arr[$key]}
      res="${res}${val}"
      #echo "$key"
    done
    echo "$res"
    #printf  "%08d" "$res"
}



# src/index.sh
# refer
# https://www.jianshu.com/p/a1f0b1e31ead