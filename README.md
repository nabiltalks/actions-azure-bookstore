# Reading Time
Reading Time is a web application that lists staff recommended books.

[![Board Status](https://dev.azure.com/GitHubBookStore/28b83540-1dbc-4c19-a26e-53603982452e/16b55032-4509-43a1-954e-b9bb5a50ca5b/_apis/work/boardbadge/0eb2c879-a73d-4932-950d-de87df85ecc4)](https://dev.azure.com/GitHubBookStore/28b83540-1dbc-4c19-a26e-53603982452e/_boards/board/t/16b55032-4509-43a1-954e-b9bb5a50ca5b/Microsoft.FeatureCategory/)

## Installing

### Prerequisites
Reading Time requires Java and [Maven](https://maven.apache.org/). It uses an embedded Tomcat servlet container. To test if you have Java and Maven installed open a terminal and type:
```
mvn --version
```

Create a `bookstore` resource group and a `bookstore-app-service-plan` service plan in Azure.

Run the following command (need to log in Azure first) and use the JSON output has the value of the `AZURE_CREDENTIALS` secret

```
az ad sp create-for-rbac --name "bookstore-review" --role contributor \
                                --scopes /subscriptions/$AZURE_SUBSCRIPTION_ID/resourceGroups/$AZURE_RESOURCE_GROUP \
                                --sdk-auth
```

### Running

To run the application:
```
mvn clean install
sh target/bin/webapp
open http://localhost:8080
```

To install without running the tests:
```
mvn -B -DskipTests=true clean install
```
To run the unit tests:
```
mvn clean test
```
To run code coverage checks:
```
mvn cobertura:check
```
To create the code coverage report:
```
mvn cobertura:cobertura
open target/site/cobertura/index.html
```
To create and view the Maven reports:
```
mvn site
open target/site/index.html
```

## Contributing
Read the [CONTRIBUTING](.github/CONTRIBUTING.md) file before contributing to this project.

## License
See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).

