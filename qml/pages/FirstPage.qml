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
import tonetest.Test 1.0


Page {
    id: page
    property int i: 0

    Media.Audio
    {
        id: playAudio
        source: "../sure.wav"
    }

    Media.SoundEffect
    {
        id: playSoundEffect
        source: "../sure.wav"
    }


    SilicaFlickable
    {
        anchors.fill: parent

        contentHeight: column.height

        Column
        {
            id: column

            width: page.width
            spacing: Theme.paddingSmall
            PageHeader
            {
                title: "Tonetest"
            }

            Button
            {
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "play with SoundEffect"
                onClicked: playSoundEffect.play()
            }

            Button
            {
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "play with Audio"
                onClicked: playAudio.play()
            }

            Image
            {
                id: logo
                source: "../tonetest.png"
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                smooth: true
                NumberAnimation on rotation
                {
                  from: 0
                  to: 360
                  loops: Animation.Infinite
                  duration: 2000
                }
            }

            Label
            {
                id: asetin
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "asetin"
            }

            Label
            {
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "sain " + test.kukkuu
            }

            Button
            {
                x: Theme.paddingSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "tyhjää"
                onClicked: test.komento()
            }



        }
    }

    Timer
    {
        interval: 1000
        running: true
        repeat: true
        onTriggered:
        {
            asetin.text = "kissa " + i
            test.kukkuu = "kissa " + i
            i++
        }

    }

    Test
    {
        id: test
    }


}


