## module: _mod_vnet_

### Create a basic virtual network in Azure using a terraform module
--------------------------------------------------------------------

* This Terraform module deploys a Virtual Network in Azure with a subnet or a set of subnets passed in as input parameters

* The module does not create nor expose a security group. This would need to be defined separately as additional security rules on subnets in the deployed network


### Required Inputs
-------------------
* These variables must be set in the `module` block when using this module.

1. resource_group_name `string`

    Description: Name of the resource group to be imported

2. vnet_location `string`

    Description: The location of the vnet to be created

_**NOTE: Since, I have used the variable type as `object({string})`, so both the required inputs are considered under same declared variable `az_rg` & also you can give variable name of your choice**_


### Optional Inputs
-------------------

* These variables have default values and don't have to be set to use this module. You may set these variables to override their default values

1. address_space `list(string)`
    
    Description: The address space that is used by the virtual network
    
    Default: [ "10.10.0.0/16" ]

2. vnet_name `string`
    
    Description: Name of the vnet to create
    
    Default: "acctvnet"

3. tags `map(string)`
    
    Description: The tags to associate with your network and subnets
    
    Default: { "ENV": "test" }

4. subnet_names `list(string)`
    
    Description: A list of public subnets inside the VNet
    
    Default: [ "web", "app", "db" ]

5. subnet_prefixes `list(string)`
    
    Description: The address prefix to use for the subnet
    
    Default: [ "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24" ]


### Outputs
-----------

1. vnet_address_space: The address space of the newly created VNet

2. vnet_guid: The GUID of the newly created VNet

3. vnet_id: The id of the newly created VNet

4. vnet_location: The location of the newly created VNet

5. vnet_name: The Name of the newly created VNet

6. vnet_subnets: The id's of subnets created inside the newly created VNet

7. vnet_subnets_name_id: Can be queried subnet-id by subnet name using `lookup(module.vnet.vnet_subnets_name_id, subnet1)`


_**NOTE: For any module, the 'Attribute' is your `outputs.tf` to demonstrate the same, we declared an output attribute in `./examples/main.tf` which syntactically represents `<module>.<module-name>.<output-variable-name>`**_

### Example Usage
-----------------

* Kindly, Refer the `./examples/` directory

* Execute `terraform apply` command in examples's directory to check-out _mod_vnet_ module

