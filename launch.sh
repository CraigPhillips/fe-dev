docker run --rm \
  -v $PWD:/src \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/src/junk-drawer:/junk-drawer \
  -v ~:/host-home \
  -it fe-dev bash
