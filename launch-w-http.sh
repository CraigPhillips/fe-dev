docker run --rm \
  -p 7000:7000 \
  -v $PWD:/src \
  -v ~/src/junk-drawer:/junk-drawer \
  -v ~:/host-home \
  -it fe-dev bash
