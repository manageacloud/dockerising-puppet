class docker-registry {

    include 'docker'

    docker::run { 'local-registry':
            image           => 'registry',
            ports           => ['5000:5000'],
            env             => ['SETTINGS_FLAVOR=dev', 'STORAGE_PATH=/var/docker-registry/local-registry'],
            volumes         => ['/var/docker-registry:/var/docker-registry'],
    }
}
