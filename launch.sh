docker run --rm \
  --privileged \
  --cap-add=SYS_ADMIN \
  -v $PWD:/src \
  -v ~/src/junk-drawer:/junk-drawer \
  -v ~:/host-home \
  -it fe-dev bash
