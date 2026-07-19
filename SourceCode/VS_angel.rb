# coding: utf-8
def vs_angel
    Sprite.draw($color_tile[1])#フィールドの表示
    Sprite.draw($color_censor[0])#センサーの表示
    #Window.draw_font(200,20,"宝:#{$ban_tile[$round*2]} step:#{$step}",$font1, :z=>5)
    #Window.draw_font(200,40,"$msx:#{$msx} $msy:#{$msy} センサー#{$select_censor}",$font1, :z=>5)

    #ライフ（ラウンド）の表示
    $numlife = 0
    loop do
        if $numlife<3-$round
            Sprite.draw($life[$numlife])
            $numlife += 1
        elsif $numlife>2
            break
        else
            Sprite.draw($lost_life[$numlife])
            $numlife += 1
        end
    end
    
    #そのラウンド中の宝タイルの位置の決定 "25"=未設定
    if $ban_tile[$round*2]==25
        $num1 = $alive_tile.sample
        $ban_tile[$round*2]=$num1
        $alive_tile.delete($num1)
    end
    $x=$ban_tile[$round*2]/5 #宝タイルのx座標(0~4)
    $y=$ban_tile[$round*2]%5 #宝タイルのy座標(0~4)

    #センサー起動による色変化
    if $count>0
        Sprite.draw($used_censor)
    end

    #右クリックによるセンサー起動保持コード
    sonar_wake

    unless $mode.include?("pause") #pause中の誤操作防止
        #センサー接触反応とソナー発生コード
        if $msy >= 65 && $msy <= 105 #上センサー
            if $msx >= 160 && $msx <= 200 #1つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(11)
                    Sprite.draw($color_censor[1][11])
                else
                    Sprite.draw($color_censor[$censor1[$x+4][$y]][11])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor1[$num1+4][$num2]==2
                            Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+4][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+4][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+4][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+4][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 225 && $msx <= 265 #2つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(12)
                    Sprite.draw($color_censor[1][12])
                else
                    Sprite.draw($color_censor[$censor1[$x+3][$y]][12])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor1[$num1+3][$num2]==2
                            Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+3][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+3][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+3][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+3][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 290 && $msx <= 330 #3つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(13)
                    Sprite.draw($color_censor[1][13])
                else
                    Sprite.draw($color_censor[$censor1[$x+2][$y]][13])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor1[$num1+2][$num2]==2
                            Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+2][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+2][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+2][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+2][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 355 && $msx <= 395 #4つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(14)
                    Sprite.draw($color_censor[1][14])
                else
                    Sprite.draw($color_censor[$censor1[$x+1][$y]][14])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor1[$num1+1][$num2]==2
                            Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1+1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 420 && $msx <= 460 #5つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(15)
                    Sprite.draw($color_censor[1][15])
                else
                    Sprite.draw($color_censor[$censor1[$x][$y]][15])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor1[$num1][$num2]==2
                            Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                        elsif $censor1[$num1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            else
                $start=0
                $finish=0
                $diff=0
            end
        elsif $msx >= 475 && $msx <= 515 #右センサー
            if $msy >= 120 && $msy <= 160 #1つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(21)
                    Sprite.draw($color_censor[1][21])
                else
                    Sprite.draw($color_censor[$censor2[$x][$y+4]][21])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor2[$num1][$num2+4]==2
                            Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+4]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+4]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+4]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+4]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 185 && $msy <= 225 #2つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(22)
                    Sprite.draw($color_censor[1][22])
                else
                    Sprite.draw($color_censor[$censor2[$x][$y+3]][22])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor2[$num1][$num2+3]==2
                            Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+3]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+3]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+3]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+3]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 250 && $msy <= 290 #3つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(23)
                    Sprite.draw($color_censor[1][23])
                else
                    Sprite.draw($color_censor[$censor2[$x][$y+2]][23])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor2[$num1][$num2+2]==2
                            Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 315 && $msy <= 355 #4つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(24)
                    Sprite.draw($color_censor[1][24])
                else
                    Sprite.draw($color_censor[$censor2[$x][$y+1]][24])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor2[$num1][$num2+1]==2
                            Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+1]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+1]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+1]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2+1]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 380 && $msy <= 420 #5つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(25)
                    Sprite.draw($color_censor[1][25])
                else
                    Sprite.draw($color_censor[$censor2[$x][$y]][25])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor2[$num1][$num2]==2
                            Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                        elsif $censor2[$num1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            else
                $start=0
                $finish=0
                $diff=0
            end
        elsif $msy >= 435 && $msy <= 475 #下センサー
            if $msx >= 160 && $msx <= 200 #1つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(31)
                    Sprite.draw($color_censor[1][31])
                else
                    Sprite.draw($color_censor[$censor3[$x+4][$y]][31])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor3[$num1+4][$num2]==2
                            Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+4][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+4][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+4][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+4][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 225 && $msx <= 265 #2つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(32)
                    Sprite.draw($color_censor[1][32])
                else
                    Sprite.draw($color_censor[$censor3[$x+3][$y]][32])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor3[$num1+3][$num2]==2
                            Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+3][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+3][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+3][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+3][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 290 && $msx <= 330 #3つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(33)
                    Sprite.draw($color_censor[1][33])
                else
                    Sprite.draw($color_censor[$censor3[$x+2][$y]][33])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor3[$num1+2][$num2]==2
                            Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+2][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+2][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+2][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+2][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 355 && $msx <= 395 #4つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(34)
                    Sprite.draw($color_censor[1][34])
                else
                    Sprite.draw($color_censor[$censor3[$x+1][$y]][34])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor3[$num1+1][$num2]==2
                            Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1+1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msx >= 420 && $msx <= 460 #5つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(35)
                    Sprite.draw($color_censor[1][35])
                else
                    Sprite.draw($color_censor[$censor3[$x][$y]][35])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor3[$num1][$num2]==2
                            Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                        elsif $censor3[$num1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            else
                $start=0
                $finish=0
                $diff=0
            end
        elsif $msx >= 105 && $msx <= 145 #左センサー
            if $msy >= 120 && $msy <= 160 #1つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(41)
                    Sprite.draw($color_censor[1][41])
                else
                    Sprite.draw($color_censor[$censor4[$x][$y+4]][41])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor4[$num1][$num2+4]==2
                            Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+4]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+4]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+4]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+4]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 185 && $msy <= 225 #2つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(42)
                    Sprite.draw($color_censor[1][42])
                else
                    Sprite.draw($color_censor[$censor4[$x][$y+3]][42])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor4[$num1][$num2+3]==2
                            Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+3]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+3]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+3]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+3]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 250 && $msy <= 290 #3つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(43)
                    Sprite.draw($color_censor[1][43])
                else
                    Sprite.draw($color_censor[$censor4[$x][$y+2]][43])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor4[$num1][$num2+2]==2
                            Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 315 && $msy <= 355 #4つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(44)
                    Sprite.draw($color_censor[1][44])
                else
                    Sprite.draw($color_censor[$censor4[$x][$y+1]][44])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor4[$num1][$num2+1]==2
                            Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+1]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+1]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+1]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2+1]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            elsif $msy >= 380 && $msy <= 420 #5つ目
                if $start == 0
                    $start = Time.now
                end
                Sprite.draw($color_tile[0])
                #ソナーが起動しているかどうか
                unless $select_censor.include?(45)
                    Sprite.draw($color_censor[1][45])
                else
                    Sprite.draw($color_censor[$censor4[$x][$y]][45])
                end
                $num1=0
                loop do
                    $num2=0
                    loop do
                        $finish = Time.now
                        $diff = $finish - $start
                        if $censor4[$num1][$num2]==2
                            Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2]==3 && $diff>=0.07
                            Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2]==4 && $diff>=0.14
                            Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2]==5 && $diff>=0.21
                            Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                        elsif $censor4[$num1][$num2]==6 && $diff>=0.28
                            Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                        end
                        $num2+=1
                        if $num2>4
                            break
                        end
                    end
                    $num1+=1
                    if $num1>4
                        break
                    end
                end
            else
                $start=0
                $finish=0
                $diff=0
            end
        else
            $start=0
            $finish=0
            $diff=0
        end

        #センサー起動コード
        if $step>=1 && $count<2 && Input.mousePush?(M_LBUTTON)
            if $msy >= 65 && $msy <= 105 #上センサー
                if $msx >= 160 && $msx <= 200 #1つ目 重複禁止　選択済み記録配列へ追加　センサー表示変化
                    unless $select_censor.include?(11)
                        $used_censor[$count]=Sprite.new(160,65,$shadow[$censor1[$x+4][$y]])
                        $select_censor.push(11)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 225 && $msx <= 265 #2つ目
                    unless $select_censor.include?(12)
                        $used_censor[$count]=Sprite.new(225,65,$shadow[$censor1[$x+3][$y]])
                        $select_censor.push(12)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 290 && $msx <= 330 #3つ目
                    unless $select_censor.include?(13)
                        $used_censor[$count]=Sprite.new(290,65,$shadow[$censor1[$x+2][$y]])
                        $select_censor.push(13)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 355 && $msx <= 395 #4つ目
                    unless $select_censor.include?(14)
                        $used_censor[$count]=Sprite.new(355,65,$shadow[$censor1[$x+1][$y]])
                        $select_censor.push(14)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 420 && $msx <= 460 #5つ目
                    unless $select_censor.include?(15)
                        $used_censor[$count]=Sprite.new(420,65,$shadow[$censor1[$x][$y]])
                        $select_censor.push(15)
                        $count+=1
                        $step+=1
                    end
                end
            elsif $msx >= 475 && $msx <=515 #右センサー
                if $msy >= 120 && $msy <= 160 #1つ目 重複禁止　選択済み記録配列へ追加　センサー表示変化
                    unless $select_censor.include?(21)
                        $used_censor[$count]=Sprite.new(475,120,$shadow[$censor2[$x][$y+4]])
                        $select_censor.push(21)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 185 && $msy <= 225 #2つ目
                    unless $select_censor.include?(22)
                        $used_censor[$count]=Sprite.new(475,185,$shadow[$censor2[$x][$y+3]])
                        $select_censor.push(22)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 250 && $msy <= 290 #3つ目
                    unless $select_censor.include?(23)
                        $used_censor[$count]=Sprite.new(475,250,$shadow[$censor2[$x][$y+2]])
                        $select_censor.push(23)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 315 && $msy <= 355 #4つ目
                    unless $select_censor.include?(24)
                        $used_censor[$count]=Sprite.new(475,315,$shadow[$censor2[$x][$y+1]])
                        $select_censor.push(24)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 380 && $msy <= 420 #5つ目
                    unless $select_censor.include?(25)
                        $used_censor[$count]=Sprite.new(475,380,$shadow[$censor2[$x][$y]])
                        $select_censor.push(25)
                        $count+=1
                        $step+=1
                    end
                end
            elsif $msy >= 435 && $msy <= 475 #下センサー
                if $msx >= 160 && $msx <= 200 #1つ目 重複禁止　選択済み記録配列へ追加　センサー表示変化
                    unless $select_censor.include?(31)
                        $used_censor[$count]=Sprite.new(160,435,$shadow[$censor3[$x+4][$y]])
                        $select_censor.push(31)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 225 && $msx <= 265 #2つ目
                    unless $select_censor.include?(32)
                        $used_censor[$count]=Sprite.new(225,435,$shadow[$censor3[$x+3][$y]])
                        $select_censor.push(32)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 290 && $msx <= 330 #3つ目
                    unless $select_censor.include?(33)
                        $used_censor[$count]=Sprite.new(290,435,$shadow[$censor3[$x+2][$y]])
                        $select_censor.push(33)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 355 && $msx <= 395 #4つ目
                    unless $select_censor.include?(34)
                        $used_censor[$count]=Sprite.new(355,435,$shadow[$censor3[$x+1][$y]])
                        $select_censor.push(34)
                        $count+=1
                        $step+=1
                    end
                elsif $msx >= 420 && $msx <= 460 #5つ目
                    unless $select_censor.include?(35)
                        $used_censor[$count]=Sprite.new(420,435,$shadow[$censor3[$x][$y]])
                        $select_censor.push(35)
                        $count+=1
                        $step+=1
                    end
                end
            elsif $msx >= 105 && $msx <= 145 #左センサー
                if $msy >= 120 && $msy <= 160 #1つ目 重複禁止　選択済み記録配列へ追加　センサー表示変化
                    unless $select_censor.include?(41)
                        $used_censor[$count]=Sprite.new(105,120,$shadow[$censor4[$x][$y+4]])
                        $select_censor.push(41)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 185 && $msy <= 225 #2つ目
                    unless $select_censor.include?(42)
                        $used_censor[$count]=Sprite.new(105,185,$shadow[$censor4[$x][$y+3]])
                        $select_censor.push(42)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 250 && $msy <= 290 #3つ目
                    unless $select_censor.include?(43)
                        $used_censor[$count]=Sprite.new(105,250,$shadow[$censor4[$x][$y+2]])
                        $select_censor.push(43)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 315 && $msy <= 355 #4つ目
                    unless $select_censor.include?(44)
                        $used_censor[$count]=Sprite.new(105,315,$shadow[$censor4[$x][$y+1]])
                        $select_censor.push(44)
                        $count+=1
                        $step+=1
                    end
                elsif $msy >= 380 && $msy <= 420 #5つ目
                    unless $select_censor.include?(45)
                        $used_censor[$count]=Sprite.new(105,380,$shadow[$censor4[$x][$y]])
                        $select_censor.push(45)
                        $count+=1
                        $step+=1
                    end
                end
            end
        end

        #タイル選択コード（宝マス選択とBAN選択）
        if $count==2 && Input.mousePush?(M_LBUTTON)
            $x1=150 #タイル初期x座標
            $y1=110 #タイル初期y座標
            $num1=0
            loop do
                $num2=0
                if $msx>=$num1*65+$x1 && $msx<=$num1*65+$x1+60 #マウスの位置(x)
                    loop do
                        if $msy>=$num2*65+$y1 && $msy<=$num2*65+$y1+60 #マウスに位置(y)
                            $step+=1
                            if $x==$num1 && $y==$num2 && $win==0 && $lose==0 #正誤判定
                                $win += 1
                            elsif $ban_tile[$round*2+1]==25 && $win==0 && $lose==0 #失敗&BANタイル決定
                                $lose += 1
                                $ban_tile[$round*2+1]=$num1*5+$num2
                                $alive_tile.delete($num1*5+$num2)
                            end
                        end
                        $num2 += 1
                        if $num2>4
                            break
                        end
                    end
                end
                $num1 += 1
                if $num1>4
                    break
                end
            end
        end
    end

    #足跡表示機能（BANタイル）
    $foota=0
    $footb=0
    $footi=0
    loop do
        if $footi >= $round*2
            break
        end
        $foota = $ban_tile[$footi]/5
        $footb = $ban_tile[$footi]%5
        Window.draw($foota*65+150,$footb*65+110,$footprint)
        $footi += 1
    end

    #宝タイルフラッグ配列（宝タイルの仮選択） イメージはマインスイーパーのフラッグ機能
    if $count!=0
        unless $mode.include?("pause") #pause中の誤操作防止
            if Input.mousePush?(M_RBUTTON)
                $x1=150 #タイル初期x座標
                $y1=110 #タイル初期y座標
                $num1=0
                loop do
                    $num2=0
                    if $msx>=$num1*65+$x1 && $msx<=$num1*65+$x1+60 #マウスの位置(x)
                        loop do
                            if $msy>=$num2*65+$y1 && $msy<=$num2*65+$y1+60 #マウスに位置(y)
                                if $flag_image.include?($num1*5+$num2) #既に配列にあるとき除去
                                    $flag_image.delete($num1*5+$num2)
                                else
                                    $flag_image.push($num1*5+$num2) #ない時、追加
                                end
                            end
                            $num2 += 1
                            if $num2>4
                                break
                            end
                        end
                    end
                    $num1 += 1
                    if $num1>4
                        break
                    end
                end
            end
        end
    end

    #フラッグ表示
    $fx = 150 #タイルの初期x座標
    $fy = 110 #タイルの初期y座標
    $numFX=0
    $i=0
    loop do
        $numFY=0
        loop do
            if $flag_image.include?($numFX*5+$numFY)
                Window.draw($numFX*65+$fx,$numFY*65+$fy,$flag, z=3)
            end
            $numFY += 1
            $i += 1
            if $numFY>4
                break
            end
        end
        $numFX += 1
        if $numFX>4
            break
        end
    end

    #プレイヤー勝利
    if $win==1
        if $start1==0
            $start1= Time.now
        end
        $finish1 = Time.now
        $diff1 = $finish1 - $start1
        $flag_image = [] #フラッグ初期化
        Window.draw_alpha(0,0,$black,175)
        $result_image[0].alpha=230
        $result_image[1].alpha=230
        Sprite.draw($result_image)
        Window.draw_alpha(115,318,$buttonA,230) #もう一度遊ぶボタン
        Window.draw_alpha(325,318,$buttonA,230) #メニュー画面へボタン
        Window.draw_font(264,204,"勝利!!",$font_result)
        Window.draw_font(262,200,"勝利!!",$font_result,{color:[255,0,0]})
        Window.draw_font(50,550,"そんな……私が負けた……？",$font1, :z=>4)
        Window.draw_font(210,600,"次は絶対負けません",$font2, :z=>4)
        Window.draw(400,420+$y2/2,$loseface_girl)

        #もう一度遊ぶボタン
        if $msx>=115 && $msx<=315 && $msy>=318 && $msy<=378
            unless $mode.include?("pause") #pause中の誤操作防止
                Window.draw_font(133,330,"もう一度遊ぶ",$font3,{:color=>[0,0,0]})
                if Input.mousePush?(M_LBUTTON) && $diff1>=0.01
                    $alive_tile = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                    $ban_tile = [25,25,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
                    $used_censor = [] #使用済みセンサーの表示配列
                    $select_censor = [] #センサー被り回避配列
                    $R_Click_sonar = [] #右クリックのソナー用
                    $count = 0
                    $round = 0
                    $lose = 0
                    $win = 0
                    $step = 0
                    $start1 = 0
                    $finish1 = 0
                    $diff1 = 0
                    $start2 = 0
                    $finish2 = 0
                    $diff2 = 0
                end
            end
        else
            Window.draw_alpha(117,320,$buttonB,230,3)
            Window.draw_font(133,330,"もう一度遊ぶ",$font3, :z=>4)
        end

        #メニュー画面へボタン
        if $msx>=325 && $msx<=525 && $msy>=318 && $msy<=378
            unless $mode.include?("pause") #pause中の誤操作防止
                Window.draw_font(330,330,"メニュー画面へ",$font3,{:color=>[0,0,0]})
                if Input.mousePush?(M_LBUTTON) && $diff1>=0.01
                    $mode.delete("pause")
                    $mode.delete("VS_angel")
                    $mode.push("top_page")
                    $alive_tile = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                    $ban_tile = [25,25,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
                    $used_censor = [] #使用済みセンサーの表示配列
                    $select_censor = [] #センサー被り回避配列
                    $R_Click_sonar = [] #右クリックのソナー用
                    $count = 0
                    $round = 0
                    $lose = 0
                    $win = 0
                    $step = 0
                    $start1 = 0
                    $finish1 = 0
                    $diff1 = 0
                    $start2 = 0
                    $finish2 = 0
                    $diff2 = 0
                end
            end
        else
            Window.draw_alpha(327,320,$buttonB,230,3)
            Window.draw_font(330,330,"メニュー画面へ",$font3, :z=>4)
        end
    end

    #1,2ラウンド目負け
    if $lose==1 && $round<=1
        if $start1==0
            $start1= Time.now
        end
        $finish1 = Time.now
        $diff1 = $finish1 - $start1
        $flag_image = [] #フラッグ初期化
        Window.draw_alpha(0,0,$black,175)
        $result_image[0].alpha=230
        $result_image[1].alpha=230
        Sprite.draw($result_image)
        Window.draw_alpha(220,318,$buttonA,230)
        Window.draw_font(275,200,"失敗",$font_result)
        Window.draw_font(50,550,"残念、不正解です。",$font1, :z=>4)
        Window.draw_font(50,570,"あと#{2-$round}回の失敗で私の勝ちですね",$font1, :z=>4)
        Window.draw(400,420+$y2,$winface_girl)
        if $msx>=220 && $msx<=420 && $msy>=318 && $msy<=378
            unless $mode.include?("pause") #pause中の誤操作防止
                Window.draw_font(225,325,"次のラウンドへ",$font3,{:color=>[0,0,0]})
                #次のラウンドのための変数初期化
                if Input.mousePush?(M_LBUTTON) && $diff1>=0.01
                    $used_censor = [] #使用済みセンサーの表示配列
                    $select_censor = [] #センサー被り回避配列
                    $R_Click_sonar = [] #右クリックのソナー用
                    $count = 0
                    $round += 1
                    $lose = 0
                    $step = 0
                    $start1 = 0
                    $finish1 = 0
                    $diff1 = 0
                    $start2 = 0
                    $finish2 = 0
                    $diff2 = 0
                end
            end
        else
            Window.draw_alpha(222,320,$buttonB,230,3)
            Window.draw_font(225,325,"次のラウンドへ",$font3, :z=>4)
        end
    #ゲームオーバー
    elsif $lose==1 && $round==2
        if $start1==0
            $start1= Time.now
        end
        $finish1 = Time.now
        $diff1 = $finish1 - $start1
        $flag_image = [] #フラッグ初期化
        Sprite.draw($lost_life)
        Window.draw_alpha(0,0,$black,175)
        $result_image[0].alpha=230
        $result_image[1].alpha=230
        Sprite.draw($result_image)
        Window.draw_alpha(115,318,$buttonA,230) #もう一度遊ぶボタン
        Window.draw_alpha(325,318,$buttonA,230) #メニュー画面へボタン
        Window.draw_font(264,204,"敗北...",$font_result,{color:[100,100,100]})
        Window.draw_font(262,200,"敗北...",$font_result,{color:[0,0,255]})
        Window.draw_font(50,550,"私の勝ちです。",$font1, :z=>4)
        Window.draw_font(50,570,"この調子では次も勝てそうですね",$font1, :z=>4)
        Window.draw(400,420+$y2,$winface_girl2)

        #もう一度遊ぶボタン
        if $msx>=115 && $msx<=315 && $msy>=318 && $msy<=378
            unless $mode.include?("pause") #pause中の誤操作防止
                Window.draw_font(133,330,"もう一度遊ぶ",$font3,{:color=>[0,0,0]})
                if Input.mousePush?(M_LBUTTON) && $diff1>=0.01
                    $alive_tile = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                    $ban_tile = [25,25,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
                    $used_censor = [] #使用済みセンサーの表示配列
                    $select_censor = [] #センサー被り回避配列
                    $R_Click_sonar = [] #右クリックのソナー用
                    $count = 0
                    $round = 0
                    $lose = 0
                    $step = 0
                    $start1 = 0
                    $finish1 = 0
                    $diff1 = 0
                    $start2 = 0
                    $finish2 = 0
                    $diff2 = 0
                end
            end
        else
            Window.draw_alpha(117,320,$buttonB,230,3)
            Window.draw_font(133,330,"もう一度遊ぶ",$font3, :z=>4)
        end

        #メニュー画面へボタン
        if $msx>=325 && $msx<=525 && $msy>=318 && $msy<=378
            unless $mode.include?("pause") #pause中の誤操作防止
                Window.draw_font(330,330,"メニュー画面へ",$font3,{:color=>[0,0,0]})
                if Input.mousePush?(M_LBUTTON) && $diff1>=0.01
                    $mode.delete("pause")
                    $mode.delete("VS_angel")
                    $mode.push("top_page")
                    $alive_tile = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                    $ban_tile = [25,25,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
                    $used_censor = [] #使用済みセンサーの表示配列
                    $select_censor = [] #センサー被り回避配列
                    $R_Click_sonar = [] #右クリックのソナー用
                    $count = 0
                    $round = 0
                    $lose = 0
                    $win = 0
                    $step = 0
                    $start1 = 0
                    $finish1 = 0
                    $diff1 = 0
                    $start2 = 0
                    $finish2 = 0
                    $diff2 = 0
                end
            end
        else
            Window.draw_alpha(327,320,$buttonB,230,3)
            Window.draw_font(330,330,"メニュー画面へ",$font3, :z=>4)
        end
    end


    #天使や吹き出し、コメントの描写コード
    if $step>=0
        Window.draw_alpha(0,0,$black,175) if $step==0 && $round==0
        if $start2==0
            $num4=0
            $start2 = Time.now
        end
        $finish2 = Time.now
        $diff2 = $finish2 - $start2
        if $diff2>=1
            if $num4<230
                Window.fps=60
                $coment.alpha=$num4
                $girl.alpha=$num4
                $num4+=4
                Sprite.draw($girl)
            end
            Sprite.draw($coment)
            if $num4>=230
                Window.draw_font(50,550,"さぁ、ゲームを始めましょう？",$font1) if $step==0
                Window.draw_font(320,620,">>クリック",$font2, :z=>4) if $step==0
                Window.draw_font(50,550,"ﾈｺ様の石像をクリックして宝マスを探し",$font1) if $step==1
                Window.draw_font(50,570,"てくださいな",$font1) if $step==1
                Window.draw_font(50,550,"2つまで石像の探索機(ソナー)を使うこと",$font1) if $step==2
                Window.draw_font(50,570,"ができます",$font1) if $step==2
                Window.draw_font(50,550,"では、宝マスはどこだと思いますか？",$font1) if $step==3
                loop do
                    Window.fps=60
                    Window.draw(400,420+$y2,$normal_girl) if $step>=0 && $step<4
                    if $num5==0
                        $y2 += 0.3
                    elsif $num5==1
                        $y2 -= 0.3
                    end
                    if $y2>=15
                        $num5+=1
                    elsif $y2<=0
                        $num5-=1
                    end
                    break
                end
            end
            unless $mode.include?("pause") #pause中の誤操作防止
                if $num4>=230 && Input.mousePush?(M_LBUTTON) && $step<1
                    $step+=1
                end
            end
        end
    end
end
