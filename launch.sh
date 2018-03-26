docker run --rm \
  -v $PWD:/src \
  -v ~/src/junk-drawer:/junk-drawer \
  -v ~:/host-home \
  -it fe-dev bash
