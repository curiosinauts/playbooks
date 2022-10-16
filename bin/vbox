#!/bin/bash -e

if [ "${VBOX_DEBUG}" = "true" ]; then
    set -x
fi

base="debian/bullseye64"
declare organization
declare box

init() {
    echo "${1} ${2}" > .build.vbox
}

if [[ -f .build.vbox ]]; then
    organization=$(cat <.build.vbox | awk '{print $1}')
    box=$(cat <.build.vbox | awk '{print $2}')
fi

check_config() {
    [[ -f .build.vbox ]] || (echo "execute vbox init"; exit 1)
}

template() {
    check_config

    version=$1

    mkdir -p ~/.vbox/build
    mkdir -p ~/.vbox/template

    template=$(cat <<EOF
{
    "builders": [{
        "box_name"    : "${box}",
        "output_dir"  : "${HOME}/.vbox/build/${organization}/${box}",
        "box_version" : "${version}",      
        "communicator": "ssh",
        "source_path" : "${base}",
        "provider"    : "virtualbox",
        "skip_add"    : true,
        "type"        : "vagrant"
    }],
    "provisioners": [{
        "ansible_env_vars": [ "ANSIBLE_STDOUT_CALLBACK=debug" ],
        "extra_arguments" : [ "--extra-vars", "target=default user=vagrant username=vagrant ansible_os_family=Debian" ],
        "type"            : "ansible",
        "playbook_file"   : "${box}.yml",
        "user"            : "vagrant"
    }]
}
EOF
)
    echo "${template}" > ~/.vbox/template/"${organization}_${box}".json
}

clean() {
    check_config

    if [[ -d ~/.vbox/test/"${organization}"/"${box}" ]]; then
        cd ~/.vbox/test/"${organization}"/"${box}"
        vagrant destroy -f
        rm -rf ~/.vbox/test/"${organization}"/"${box}"
    fi

    rm -rf ~/.vbox/build/"${organization}"/"${box}"

    vagrant box remove --force "${organization}"/"${box}" || true
}

build() {
    check_config

    template $1
    
    echo "packer build --force ~/.vbox/template/${organization}_${box}.json"
    packer build --force ~/.vbox/template/"${organization}_${box}".json
}

up() {
    check_config

    test_folder=~/.vbox/test/"${organization}"/"${box}"

    mkdir -p "${test_folder}"
    cd "${test_folder}"
    vagrant box add --name "${organization}"/"${box}" ~/.vbox/build/"${organization}"/"${box}"/package.box
    vagrant init "${organization}"/"${box}"
    vagrant up
    pwd
}

ssh() {
    check_config

    test_folder=~/.vbox/test/"${organization}"/"${box}"
    cd "${test_folder}"
    vagrant ssh
}

publish() {
    # vagrant cloud publish [options] organization/box-name version provider-name [provider-file]

    version=$1
    
    vagrant cloud publish \
        "${organization}"/"${box}" \
        "${version}" \
        virtualbox \
        ~/.vbox/build/"${organization}"/"${box}"/package.box \
        -d "${organization} ${box} ${version} box" \
        --version-description "${version}" \
        --release \
        --no-private \
        --short-description "${organization} ${box} ${version} box"
}

usage() {
  echo -e "Example : vbox init curiosityworks pure"
  echo
  echo -e "Example : vbox clean"
  echo
  echo -e "Example : vbox build 1.0.0"
  echo
  echo -e "Example : vbox up"
  echo
  echo -e "Example : vbox ssh"
}

case $1 in
init)
  shift
  init $1 $2
  ;;
build)
  shift
  build $1
  ;;
clean)
  clean
  ;;
up)
  up
  ;;
ssh)
  ssh 
  ;;
publish)
  shift
  publish $1 
  ;;  
--help)
  usage
  ;;
*) usage ;;
esac
