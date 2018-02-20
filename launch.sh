echo $PWD

docker run --rm \
  -v $PWD:/src \
  -v ~/.aws:/root/.aws \
  -it fe-dev bash
