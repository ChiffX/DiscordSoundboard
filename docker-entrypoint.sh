#!/bin/bash
set -e
cd /etc/DiscordSoundboard/bin

cp application.properties /etc/DiscordSoundboard/config
cd /etc/DiscordSoundboard/config

sed -i 's/bot_token=SOME_TOKEN_YOU_GOT_FROM_DISCORD/bot_token='$bottoken'/g' application.properties
sed -i 's/username_to_join_channel=YourUserName/username_to_join_channel='$username'/g' application.properties
sed -i 's/respond_to_chat_commands=true/respond_to_chat_commands='$chatcommands'/g' application.properties
sed -i 's/respond_to_dm=true/respond_to_dm='$dm'/g' application.properties
sed -i 's/command_character=?/command_character='$commandcharacter'/g' application.properties
sed -i 's/message_size_limit=2000/message_size_limit='$sizelimit'/g' application.properties
sed -i 's/leave_suffix=_leave/leave_suffix='$leavesuffix'/g' application.properties
sed -i 's/player=JDAPlayer/player='$player'/g' application.properties
sed -i 's/allowedUserIds=/allowedUserIds='$allowedusers'/g' application.properties
sed -i 's/bannedUserIds=/bannedUserIds='$bannedusers'/g' application.properties
sed -i 's/entranceForAll=/entranceForAll='$entranceForAll'/g' application.properties
sed -i 's/playEntranceOnMove=_leave/playEntranceOnMove='playEntranceOnMove'/g' application.properties
sed -i 's/playEntranceOnJoin=_leave/playEntranceOnJoin='playEntranceOnJoin'/g' application.properties
sed -i 's/leaveAfterPlayback=_leave/leaveAfterPlayback='leaveAfterPlayback'/g' application.properties

cd /etc/DiscordSoundboard/bin

cp /etc/DiscordSoundboard/lib/DiscordSoundboard* /etc/DiscordSoundboard/bin/DiscordSoundboard.jar
exec java -Dserver.port=8080 -jar /etc/DiscordSoundboard/bin/DiscordSoundboard.jar --spring.config.location=classpath:/etc/DiscordSoundboard/config

exec "$@"
