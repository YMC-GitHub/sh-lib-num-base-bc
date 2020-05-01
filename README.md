# sh lib num-base-bc

## desc

some function to handle the convertion of system of numeration for ymc shell lib

## deps

- [ ] sh-lib-arr
- [ ] sh-lib-stack
- [x] sh-lib-time-cost

## feat

- [x] num_base_bc_10_to_xx
- [x] num_base_bc_2_to_10

```sh
cat src/index.with.str.sh | grep "function " | sed "s/function */- [x] /g"  | sed "s/(){//g"
```

## how to use for poduction?

```sh
# get the code

# run the index file
# ./index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage

```

## how to use for developer?

```sh
# get the code

# run test
./src/test.sh
#2 get some fail test
#./src/test.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
