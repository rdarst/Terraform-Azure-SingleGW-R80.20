# Adjust as needed
my_custom_data = <<-EOF
                #!/bin/bash
                clish -c 'set user admin shell /bin/bash' -s
                blink_config -s 'gateway_cluster_member=false&ftw_sic_key=vpn12345&upload_info=true&download_info=true'
                ExtAddr="$(ip addr show dev eth0 | awk "/inet/{print \$2; exit}" | cut -d / -f 1)"
                IntAddr="$(ip addr show dev eth1 | awk "/inet/{print \$2; exit}" | cut -d / -f 1)"
                dynamic_objects -n LocalGatewayExternal -r "$ExtAddr" "$ExtAddr" -a
                dynamic_objects -n LocalGatewayInternal -r "$IntAddr" "$IntAddr" -a
                shutdown -r now
                EOF
