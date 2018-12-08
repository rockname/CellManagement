# CellManagement
This is a TableView cell management good practice sample.

There are 3 pattern DataSources, Simple, Commonized and Generalized.


In this sample project, you can switch the pattern by changing the Schemes.

## [SimpleDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/SimpleDataSource.swift)
So simple implementation, there is no effort to reduce the number of lines.

## [CommonizedDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/CommonizedDataSource.swift)
This datasouce has an intermediate representation between TableView and DataSouce.

The intermediate representation shows double array, the outer array represents the table section and the inner array represents the table row.

So the conditional branches declared everywhere in datasouce delegate methods is aggregated to the intermediate representation.

## [GeneralizedDataSouce](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/GeneralizedDataSource.swift)
This DataSource inherits [StructuredTableCellDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/Utilities/TableView/StructuredTableCellDataSource.swift) which implements common process around tableview datasouce.

So all you have to define is just about cell configuration in this datasouce.

## Acknowledgment
This sample is created by refering to
[ValueCellDataSource.swift](https://github.com/kickstarter/ios-oss/blob/master/Library/DataSource/ValueCellDataSource.swift) very much.
