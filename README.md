# ROSDoc Github Action
Documentation generation for ROS projects using [rosdoc_lite](http://wiki.ros.org/rosdoc_lite).



## Usage

```
name: rosdoc
on:
  push:
    branches-ignore:
      - master
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - name: rosdoc
        id: rosdoc
        uses: AutoModality/action-rosdoc@v1
```

See [action.yml](action.yml) for options.


## Examples

### Attach Artifact to Action Downloads

```
name: rosdoc
on:
  push:
    branches-ignore:
      - master
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - name: Generate ROSdoc
        id: rosdoc
        uses: AutoModality/action-rosdoc@v1
      - name: Attach Artifact
        uses: actions/upload-artifact@v1
        with:
          name: rosdoc
          path: ${{ steps.rosdoc.outputs.docs-path }}
```


### Publish to Azure Storage


```
name: rosdoc
on:
  push:
    branches-ignore:
      - master
jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1
      - name: Generate ROSdoc
        id: rosdoc
        uses: AutoModality/action-rosdoc@v1
      - name: Publish to Azure Storage
        uses: bacongobbler/azure-blob-storage-upload@v1.0.0
        with:
          source_dir: ${{ steps.rosdoc.outputs.docs-path }}
          container_name: $web
          connection_string: ${{ secrets.AMROSDOC_AZURE_STORAGE_CONNECTION_STRING }}
          extra_args: --destination-path ${{github.repository}}
```
