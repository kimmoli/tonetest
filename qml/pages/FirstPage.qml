/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.0 as Media


Page {
    id: page
    property bool i: false

    property alias playAudio: playAudio

    Media.Audio
    {
        id: playAudio
        source: "../" + toneAudio.value + ".wav"
        volume: barAudio
        onStatusChanged:
        {
            if (playRepeat.checked && (status === Media.Audio.EndOfMedia))
                play()
        }
    }

    Media.SoundEffect
    {
        id: playSoundEffect
        source: "../" + toneSoundEffect.value + ".wav"
        volume: barSoundEffect.value
        loops: playRepeat.checked ? Media.SoundEffect.Infinite : 0
    }


    SilicaFlickable {
        anchors.fill: parent

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingSmall
            PageHeader
            {
                title: "Tonetest"
            }
            Row
            {
                x: Theme.paddingSmall
                width: column.width

                ComboBox
                {
                    id: toneSoundEffect
                    width: column.width/2
                    x: Theme.paddingSmall

                    label: "SoundEffect "
                    menu: ContextMenu
                    {
                        MenuItem { text: "sure" }
                        MenuItem { text: "makemyday" }
                        MenuItem { text: "tastyburger" }
                    }

                }
                IconButton
                {
                   anchors.top: parent.top
                   anchors.topMargin: 25
                   icon.source: playSoundEffect.playing ? 'image://theme/icon-m-pause' : 'image://theme/icon-m-play'
                   onClicked:
                   {
                       if (playSoundEffect.playing)
                           playSoundEffect.stop()
                       else
                           playSoundEffect.play()
                   }
                }

            }
            Slider
            {
                x: Theme.paddingSmall
                id: barSoundEffect
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                minimumValue: 0.0
                maximumValue: 1.0
                value: 1.0
                valueText: value.toFixed(2)
            }
            Row
            {
                x: Theme.paddingSmall
                width: column.width

                ComboBox
                {
                    id: toneAudio
                    width: column.width/2
                    x: Theme.paddingSmall

                    label: "Audio                 "
                    menu: ContextMenu
                    {
                        MenuItem { text: "sure" }
                        MenuItem { text: "makemyday" }
                        MenuItem { text: "tastyburger" }
                    }
                }

                IconButton
                {
                   anchors.top: parent.top
                   anchors.topMargin: 25
                   icon.source: playAudio.playbackState  === Media.Audio.StoppedState ? 'image://theme/icon-m-play' : 'image://theme/icon-m-pause'
                   onClicked:
                   {
                       if (playAudio.playbackState  === Media.Audio.StoppedState)
                           playAudio.play()
                       else
                           playAudio.stop()
                   }
                }

            }

            Slider
            {
                x: Theme.paddingSmall
                id: barAudio
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                minimumValue: 0.0
                maximumValue: 1.0
                value: 1.0
                valueText: value.toFixed(2)
            }


            TextSwitch
            {
                id: playRepeat
                text: "Repeat"
            }


            Image
            {
                id: logo
                source: "../tonetest.png"
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
                NumberAnimation on rotation {
                  from: 0
                  to: 360
                  loops: Animation.Infinite
                  duration: 2000
                }
            }


        }
    }
}


