#!/bin/bash

groupId="com.github.kaspiandev"
defGroupId="com.github.kaspiandev.plugintemplate.PluginTemplate"
defPath="src/main/java/com/github/kaspiandev/plugintemplate"
pluginName=$1

if [ -z "$pluginName" ]
then
    read -p "Enter new name: " pluginName
fi

sed -i -e "s/name: PluginTemplate/name: $pluginName/
          s/main: $defGroupId/main: $groupId.${pluginName,,}.$pluginName/" src/main/resources/plugin.yml
sed -i -e "s/rootProject.name = 'PluginTemplate'/rootProject.name = '$pluginName'/" settings.gradle
mv $defPath src/main/java/com/github/kaspiandev/${pluginName,,}
mv src/main/java/com/github/kaspiandev/${pluginName,,}/PluginTemplate.java src/main/java/com/github/kaspiandev/${pluginName,,}/$pluginName.java
sed -i -e "s/$groupId.plugintemplate/$groupId.${pluginName,,}/
          s/class PluginTemplate/class $pluginName/" src/main/java/com/github/kaspiandev/${pluginName,,}/$pluginName.java
