docker run --rm \
  -v $PWD:/src \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -it fe-dev bash
