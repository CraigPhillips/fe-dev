docker run --rm \
  -v $PWD:/src \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/src/junk-drawer:/junk-drawer \
  -it fe-dev bash
