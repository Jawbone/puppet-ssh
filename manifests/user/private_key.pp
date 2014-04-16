# Add a private key to a users account
define ssh::user::private_key(
    $user = undef,
    $user_home = undef,
    $key_path = undef,
    $key_name = $name,
    $source = undef,
    $content = undef
) {
    # lol stuff
    $_user_home = $user_home ? {
        undef   => "/home/${user}",
        default => $user_home
    }
    $_key_path = $key_path ? {
        undef   => "${_user_home}/.ssh/${key_name}.key",
        default => $key_path
    }
    if $content == undef {
        if $source == undef {
            fail('You must supply either a key or a file source ofr a key.')
        }
        file {$_key_path:
            owner  => $user,
            mode   => '0600',
            source => "puppet://${source}"
        }
    } else {
        file {$_key_path:
            owner   => $user,
            mode    => '0600',
            content => $content
        }
    }

}
