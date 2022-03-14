provider "ad" {
  version = "0.1.0"
}

 # Create dvd drive
resource "hyperv_machine_instance" "default" {
  name = "WindowsServer"
  dvd_drives {
    controller_number = "0"
    controller_location = "1"
    path = "c:/iso/windows-server-2016.iso"
    resource_pool_name = ""
  }
}