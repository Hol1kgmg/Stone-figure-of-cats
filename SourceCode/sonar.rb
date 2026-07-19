#右クリックによるソナー表示
def sonar_wake
    unless $mode.include?("pause") #pause中の誤操作防止
        if Input.mousePush?(M_RBUTTON)
            #ソナークリック配列へ追加するコード
            if $msy >= 65 && $msy <= 105 #上センサー
                if $msx >= 160 && $msx <= 200 #1つ目
                    unless $R_Click_sonar.include?(11)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(11)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 225 && $msx <= 265 #2つ目
                    unless $R_Click_sonar.include?(12)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(12)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 290 && $msx <= 330 #3つ目
                    unless $R_Click_sonar.include?(13)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(13)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 355 && $msx <= 395 #4つ目
                    unless $R_Click_sonar.include?(14)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(14)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 420 && $msx <= 460 #5つ目
                    unless $R_Click_sonar.include?(15)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(15)
                    else
                        $R_Click_sonar = []
                    end
                end
            elsif $msx >= 475 && $msx <= 515 #右センサー
                if $msy >= 120 && $msy <= 160 #1つ目
                    unless $R_Click_sonar.include?(21)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(21)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 185 && $msy <= 225 #2つ目
                    unless $R_Click_sonar.include?(22)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(22)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 250 && $msy <= 290 #3つ目
                    unless $R_Click_sonar.include?(23)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(23)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 315 && $msy <= 355 #4つ目
                    unless $R_Click_sonar.include?(24)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(24)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 380 && $msy <= 420 #5つ目
                    unless $R_Click_sonar.include?(25)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(25)
                    else
                        $R_Click_sonar = []
                    end
                end
            elsif $msy >= 435 && $msy <= 475 #下センサー
                if $msx >= 160 && $msx <= 200 #1つ目
                    unless $R_Click_sonar.include?(31)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(31)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 225 && $msx <= 265 #2つ目
                    unless $R_Click_sonar.include?(32)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(32)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 290 && $msx <= 330 #3つ目
                    unless $R_Click_sonar.include?(33)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(33)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 355 && $msx <= 395 #4つ目
                    unless $R_Click_sonar.include?(34)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(34)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msx >= 420 && $msx <= 460 #5つ目
                    unless $R_Click_sonar.include?(35)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(35)
                    else
                        $R_Click_sonar = []
                    end
                end
            elsif $msx >= 105 && $msx <= 145 #左センサー
                if $msy >= 120 && $msy <= 160 #1つ目
                    unless $R_Click_sonar.include?(41)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(41)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 185 && $msy <= 225 #2つ目
                    unless $R_Click_sonar.include?(42)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(42)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 250 && $msy <= 290 #3つ目
                    unless $R_Click_sonar.include?(43)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(43)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 315 && $msy <= 355 #4つ目
                    unless $R_Click_sonar.include?(44)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(44)
                    else
                        $R_Click_sonar = []
                    end
                elsif $msy >= 380 && $msy <= 420 #5つ目
                    unless $R_Click_sonar.include?(45)
                        $R_Click_sonar = []
                        $R_Click_sonar.push(45)
                    else
                        $R_Click_sonar = []
                    end
                end
            end
        end
    end
    #センサー接触反応とソナー発生コード
    if $R_Click_sonar.include?(11) #上1つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor1[$num1+4][$num2]==2
                    Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+4][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+4][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+4][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor1[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+4][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(12) #上2つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor1[$num1+3][$num2]==2
                    Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+3][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+3][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+3][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor1[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+3][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(13) #上3つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor1[$num1+2][$num2]==2
                    Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+2][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+2][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+2][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor1[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+2][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(14) #上4つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor1[$num1+1][$num2]==2
                    Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor1[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1+1][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(15) #上5つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor1[$num1][$num2]==2
                    Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor1[$num1][$num2]][5*$num1+$num2])
                elsif $censor1[$num1][$num2]==6 && $diff_c>=0.28
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
    end

    if $R_Click_sonar.include?(21) #右1つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor2[$num1][$num2+4]==2
                    Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+4]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+4]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+4]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor2[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+4]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(22) #右2つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor2[$num1][$num2+3]==2
                    Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+3]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+3]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+3]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor2[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+3]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(23) #右3つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor2[$num1][$num2+2]==2
                    Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor2[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(24) #右4つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor2[$num1][$num2+1]==2
                    Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+1]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+1]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+1]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor2[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor2[$num1][$num2+1]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(25) #右5つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor2[$num1][$num2]==2
                    Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor2[$num1][$num2]][5*$num1+$num2])
                elsif $censor2[$num1][$num2]==6 && $diff_c>=0.28
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
    end

    if $R_Click_sonar.include?(31) #下1つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor3[$num1+4][$num2]==2
                    Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+4][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+4][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+4][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor3[$num1+4][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+4][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(32) #下2つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor3[$num1+3][$num2]==2
                    Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+3][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+3][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+3][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor3[$num1+3][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+3][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(33) #下3つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor3[$num1+2][$num2]==2
                    Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+2][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+2][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+2][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor3[$num1+2][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+2][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(34) #下4つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor3[$num1+1][$num2]==2
                    Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor3[$num1+1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1+1][$num2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(35) #下5つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor3[$num1][$num2]==2
                    Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor3[$num1][$num2]][5*$num1+$num2])
                elsif $censor3[$num1][$num2]==6 && $diff_c>=0.28
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
    end

    if $R_Click_sonar.include?(41) #左1つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor4[$num1][$num2+4]==2
                    Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+4]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+4]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+4]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor4[$num1][$num2+4]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+4]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(42) #左2つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor4[$num1][$num2+3]==2
                    Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+3]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+3]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+3]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor4[$num1][$num2+3]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+3]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(43) #左3つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor4[$num1][$num2+2]==2
                    Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor4[$num1][$num2+2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+2]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(44) #左4つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor4[$num1][$num2+1]==2
                    Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+1]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+1]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+1]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor4[$num1][$num2+1]][5*$num1+$num2])
                elsif $censor4[$num1][$num2+1]==6 && $diff_c>=0.28
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
    elsif $R_Click_sonar.include?(45) #左5つ目
        if $start_c == 0
            $start_c = Time.now
        end
        Sprite.draw($color_tile[0])
        $num1=0
        loop do
            $num2=0
            loop do
                $finish_c = Time.now
                $diff_c = $finish_c - $start_c
                if $censor4[$num1][$num2]==2
                    Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2]==3 && $diff_c>=0.07
                    Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2]==4 && $diff_c>=0.14
                    Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2]==5 && $diff_c>=0.21
                    Sprite.draw($color_tile[$censor4[$num1][$num2]][5*$num1+$num2])
                elsif $censor4[$num1][$num2]==6 && $diff_c>=0.28
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
    end
end