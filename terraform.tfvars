resource_group_name         = "netapp-rg"
resource_group_location     = "swedencentral"
netapp_account_name         = "my-netapp-account"
netapp_pool_name            = "my-netapp-pool"
netapp_volume_name          = "my-netapp-volume"
active_directory_dns        = ["10.0.0.4", "10.0.0.5"]
active_directory_domain     = "folknet.intern.folksam.se"
active_directory_username   = "netapp_admin"
active_directory_password   = "YourPassword"  # Replace with your AD admin password
organizational_unit         = "CN=Computers,DC=folknet,DC=intern,DC=folksam,DC=se"
active_directory_site       = "Default-First-Site-Name"
