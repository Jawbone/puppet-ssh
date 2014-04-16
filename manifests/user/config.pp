# Add stuff to a SSH config for a specific user.
define ssh::user::config(
    $user = undef,
    $config_path = undef,
    $options = {}
) {
    $_config_path = $config_path ? {
        undef => "/home/${user}/.ssh/config",
        default => $config_path
    }
    file {$_config_path:
        owner   => $user,
        mode    => '0600',
        content => template('ssh/user/config.erb')
    }
}
