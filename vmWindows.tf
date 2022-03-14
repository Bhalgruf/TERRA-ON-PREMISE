terraform {
  required_providers {
    hyperv = {
      source = "taliesins/hyperv"
      version = "1.0.3"
    }
  }
}

provider "hyperv" {
  version         = "1.0.3"
  user            = "palier_b"
  password        = "tetedechat"
  host            = "GRIT35.grit.lab"
  port            = 135
  https           = true
  insecure        = false
  use_ntlm        = true
  tls_server_name = ""
  cacert_path     = ""
  cert_path       = ""
  key_path        = ""
  script_path     = "C:/Temp/terraform_%RAND%.cmd"
  timeout         = "30s"
}

resource "hyperv_vhd" "AD" {
  path = var.path-disk

  size = 21474836480
  
}


resource "hyperv_machine_instance" "default" {
  name = var.NameServer
  generation = var.versionGen
  automatic_critical_error_action = "Pause"
  automatic_critical_error_action_timeout = 30
  automatic_start_action = "StartIfRunning"
  automatic_start_delay = 0
  automatic_stop_action = "Save"
  checkpoint_type = "Production"
  guest_controlled_cache_types = false
  high_memory_mapped_io_space = 536870912
  lock_on_disconnect = "Off"
  low_memory_mapped_io_space = 134217728
  memory_maximum_bytes = 1099511627776
  memory_minimum_bytes = 2368709125
  memory_startup_bytes = 2368709125
  notes = ""
  processor_count = var.ProcessorNB
  smart_paging_file_path = var.StockageVM
  snapshot_file_location = var.StockageVM
  static_memory = false
  state = var.state

  # Configure integration services
 // integration_services {
 // }

  # Create a network adaptor
 network_adaptors {
    name = "LAN"
    switch_name = "DMZ"
    management_os = false
    is_legacy = false
    dynamic_mac_address = true
    static_mac_address = ""
    mac_address_spoofing = "Off"
    dhcp_guard = "Off"
    router_guard = "Off"
    port_mirroring = "None"
    ieee_priority_tag = "Off"
    vmq_weight=100
    iov_queue_pairs_requested=1
    iov_interrupt_moderation="Off"
    iov_weight=100
    ipsec_offload_maximum_security_association=512
    maximum_bandwidth=0
    minimum_bandwidth_absolute=0
    minimum_bandwidth_weight=0
    mandatory_feature_id=[]
    resource_pool_name=""
    test_replica_pool_name=""
    test_replica_switch_name=""
    virtual_subnet_id=0
    allow_teaming="On"
    not_monitored_in_cluster=false
    storm_limit=0
    dynamic_ip_address_limit=0
    device_naming="Off"
    fix_speed_10g="Off"
    packet_direct_num_procs=0
    packet_direct_moderation_count=0
    packet_direct_moderation_interval=0
    vrss_enabled=true
    vmmq_enabled=false
    vmmq_queue_pairs=16
  }


  # Create a hard disk drive
  hard_disk_drives {

    controller_type = "Ide"
    controller_number = "0"
    controller_location = "0"
    path = var.path-disk
    disk_number = 4294967295
    resource_pool_name = var.POOL-Exp
    support_persistent_reservations = false
    maximum_iops = 0
    minimum_iops = 0
    qos_policy_id = "00000000-0000-0000-0000-000000000000"
    override_cache_attributes = "Default"
  
  }

 # Create dvd drive

  dvd_drives {
    controller_number = "0"
    controller_location = "1"
    path = var.path-ISO
    resource_pool_name = var.POOL-Exp
  }
}


resource "hyperv_network_switch" "default" {
  name = "DMZ"
  notes = ""
  allow_management_os = true
  enable_embedded_teaming = false
  enable_iov = false
  enable_packet_direct = false
  minimum_bandwidth_mode = "None"
  switch_type = "Internal"
  net_adapter_names = []
  default_flow_minimum_bandwidth_absolute = 0
  default_flow_minimum_bandwidth_weight = 0
  default_queue_vmmq_enabled = false
  default_queue_vmmq_queue_pairs = 16
  default_queue_vrss_enabled = false
}