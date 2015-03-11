class container-wordpress-all-in-one { 

    class { 'docker':
            extra_parameters=> ['--insecure-registry registry.manageacloud.com.au:5000']
    }

    docker::run { 'wordpress-all-in-one':
            image           => 'registry.manageacloud.com.au:5000/puppet_wordpress_all_in_one',
            ports           => ['80:80'],
    }
}
