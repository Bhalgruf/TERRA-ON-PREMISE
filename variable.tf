variable "Version" {
  type    = string
}

variable "NameServer" {
  type    = string
    description = "Windows server 2016"
}

variable "versionGen" {
  type    =  number
    description = "Version de la generation"
}

variable "ProcessorNB" {
  type    =  number
    description = "Nombre de processeur"
}

variable "StockageVM" {
  type    = string
    description = "Zone de stockage Hyper-V et Snapshot"
}

variable "state" {
  type    = string
    description = "état de la VM au démarage"
}

variable "path-ISO" {
  type    = string
    description = "Chemin du fichier ISO"
}


variable "POOL-Exp" {
  type    = string
    description = "pool name exploitation"
}

variable "path-disk" {
  type    = string
    description = "Chemin du disque de stockage"
}

variable "ADusername" {
  type    = string
    description = " AD USER"
}

variable "ADpassword" {
  type    = string
    description = "MOT DE PASSE"
}

variable "domaine" {
  type    = string
    description = "domaine"
}

variable "source_disk" {
  type    = string
    description = "chemin"
}

