#!/bin/bash -e

# set -x

box_name=$2

clean_up() {
    if [[ -d test/"${box_name}" ]]; then    
        cd test/"${box_name}"

        vagrant destroy -f

        cd ../..
    fi

    rm -rf build/7onetella/"${box_name}"

    vagrant box remove 7onetella/"${box_name}"
}

build_image() {
    packer build --force ./"${box_name}".json
}

init_instance() {
    mkdir -p test/"${box_name}"

    vag init 7onetella/"${box_name}" testbox 192.168.0.50
}

publish() {
    scp -r build/7onetella/"${box_name}" vagrant@tmt:/home/vagrant/.vagrant_boxes/7onetella
}

usage() {
    echo -e "Usage   : box.sh <build|clean|start> <box_name>"
    echo
    echo -e "Example : box.sh build consul-cluster"
    echo
    echo -e "Example : box.sh init consul-cluster"
    echo
    echo -e "Example : box.sh clean consul-cluster"
    echo
    echo -e "Example : box.sh publish consul-cluster"
}

case $1 in
  build)
      build_image
      ;;
  clean)
      clean_up
      ;;
  init)
      init_instance
      ;;
  publish)
      publish
      ;;
  --help)
      usage
      ;;
  *)  usage
esac
