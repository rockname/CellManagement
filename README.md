# CellManagement
This is a TableView cell management good practice sample.

There are 3 pattern DataSources, Simple, Commonized and Generalized.


In this sample project, you can switch the pattern by changing the Schemes.

## 1. [SimpleDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/SimpleDataSource.swift)
So simple implementation, there is no effort to reduce the number of lines.

## 2. [CommonizedDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/CommonizedDataSource.swift)
This datasouce has an intermediate representation between TableView and DataSouce.

The intermediate representation shows double array, the outer array represents the table section and the inner array represents the table row.

So the conditional branches declared everywhere in datasouce delegate methods is aggregated to the intermediate representation.

## 3. [GeneralizedDataSouce](https://github.com/rockname/CellManagement/blob/master/CellManagemant/DataSources/GeneralizedDataSource.swift)
This DataSource generalized the above CommonizedDataSource's common processes by inheriting [StructuredTableCellDataSource](https://github.com/rockname/CellManagement/blob/master/CellManagemant/Utilities/TableView/StructuredTableCellDataSource.swift).

So all you have to define is just about cell configuration in this datasouce.

## Acknowledgment
This sample is created by refering to
[ValueCellDataSource.swift](https://github.com/kickstarter/ios-oss/blob/master/Library/DataSource/ValueCellDataSource.swift) very much.
