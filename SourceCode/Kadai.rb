# coding: utf-8
require 'dxruby'
$font1 = Font.new(27,"メイリオ",{weight:500}) #表示フォント
$font2 = Font.new(10) #表示小文字フォント
$font3 = Font.new(40,font_name="メイリオ",{weight:700}) #ポーズ用選択肢文字・リザルト選択ボタン文字
$font4 = Font.new(100,fontname="アンニャントロマン",hash={weight:800})
$font_result = Font.new(70,font_name="メイリオ",{weight:700}) #rリザルト文字

#画面設定
Window.caption = "ﾈｺのせきぞう"
Window.bgcolor = [0, 0, 0, 0]  # 背景色設定
Window.width = 640
Window.height = 640
Window.load_icon("../images/icon_image.ico")

#背景
$back_image = Image.load("../images/back_image2.jpg")
$back_screen = Sprite.new(0,0,$back_image)

#タイトルロゴ
$title_image = Image.load("../images/title_logo.png")
$title_logo = Sprite.new(0,60,$title_image)

$round = 0 #ラウンド数
$count = 0 #センサー使用回数
$win = 0 #正解で+1
$lose = 0 #失敗で+1
$ok = 0 #チュートリアル専用ソナー許可変数　on==1のとき使用可能
$step= 0 #天使コメントの表示順用変数
$numlife= 0
$num1 = 0
$num2 = 0
$num3 = 0
$num4 = 0 #天使用 コメントalpha値変数
$num5 = 0 #天使用 表示画像y座標変数
$num6 = 0 #チュートリアルフィールド画像のalpha値変数
$num7 = 0 #チュートリアルフィールド画像のalpha値変数が3250超えた回数（3回で次のstep）
$numF = 0 #フラッグの表示ループ用変数
$numFX = 0 #フラッグの表示ループ用変数
$numFY = 0 #フラッグの表示ループ用変数
$footx = 0 #足跡表示用のループ変数x
$footy = 0 #足跡表示用のループ変数y
$footi = 0 #足跡表示用ループ変数i
$start = 0 #センサー時間計測
$finish = 0 #センサー時間計測
$diff = 0 #センサー時間計測
$start1 = 0 #リザルトボタンとタイル選択のクリック座標が一致した時に意図しない選択を避けるための時間
$finish1 = 0 #リザルトボタンとタイル選択のクリック座標が一致した時に意図しない選択を避けるための時間
$diff1 = 0 #リザルトボタンとタイル選択のクリック座標が一致した時に意図しない選択を避けるための時間
$start2 = 0 #天使コメント用の時間
$finish2 = 0 #天使コメント用の時間
$iff2 = 0 #天使コメント用の時間
$start_c = 0 ##右クリックソナー用の固有変数
$finish_c = 0 ##右クリックソナー用の固有変数
$diff_c = 0 ##右クリックソナー用の固有変数
$x = 0
$y = 0
$x1 = 0
$y1 = 0
$x2 = 0
$y2 = 0 #天使y座標
$fx = 0 #フラッグ描写用
$fy = 0 #フラッグ描写用
$i = 0 #配列番号 石像:i=10+10*num1+1+num2 タイル:i+=1

$mode = ["top_page"] #top_page:トップページ tutorial:チュートリアル VS_angel:対戦モード pause:ポーズモード
$tile = [] #マス目の配列
$censor = [] #センサーの表示配列
$used_censor = [] #使用済みセンサーの表示配列
$select_censor = [] #重複禁止センサー表示配列
$R_Click_sonar = [] #右クリックのソナー用
$flag_image = [] #各タイルのフラッグ建設配列
$alive_tile_tutorial = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列 チュートリアルのため１は最初からBAN
$ban_tile_tutorial = [3,0,25,25,25,25] #チュートリアル宝物タイル＆選択禁止タイル配列 (25は仮置き)
$alive_tile = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
$ban_tile = [25,25,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
$color_tile = [] #タイルの色配列(0:灰 1:白 2:赤 3:橙 4:緑 5:青 6:水 7:黄)
$color_censor = [] #センサーの色配列(0:灰 1:白 2:赤 3:橙 4:緑 5:青 6:水 7:黄)
$censor1 = [[4,5,5,6,0],[4,5,5,6,0],[4,0,5,6,0],[3,4,4,5,6],[2,3,4,5,6],[3,4,4,5,6],[4,0,5,6,0],[4,5,5,6,0],[4,5,5,6,0]]
$censor2 = [[0,0,0,6,6,6,0,0,0],[6,6,6,5,5,5,6,6,6],[5,5,5,4,4,4,5,5,5],[5,5,0,4,3,4,0,5,5],[4,4,4,3,2,3,4,4,4]]
$censor3 = [[0,6,5,5,4],[0,6,5,5,4],[0,6,5,0,4],[6,5,4,4,3],[6,5,4,3,2],[6,5,4,4,3],[0,6,5,0,4],[0,6,5,5,4],[0,6,5,5,4]]
$censor4 = [[4,4,4,3,2,3,4,4,4],[5,5,0,4,3,4,0,5,5],[5,5,5,4,4,4,5,5,5],[6,6,6,5,5,5,6,6,6],[0,0,0,6,6,6,0,0,0]]
$shadow = Image.load_tiles("../images/shadow_censor.png",4,2)  #使用済みセンサーのエフェクト

#リザルト画面
$result_windowA = Image.new(430,300,[255,255,255])
$result_windowB = Image.new(426,296,[0,0,0])
$result_image= []
$result_image[0] = Sprite.new(105,100,$result_windowA)
$result_image[1] = Sprite.new(107,102,$result_windowB)


$footprint = Image.load("../images/footprintA.png") #足跡画像

$button0 = Image.new(150,60,[255,0,51]) #ボタン
$button_image = Image.load("../images/menu_button.png") #メニューボタン画像
$menu_button = Sprite.new(580,0,$button_image) #ポーズ用ボタン
$buttonA = Image.new(200,60,[255,255,255]) #白色ボタン
$buttonB = Image.new(196,56,[0,0,0]) #黒色ボタン
$red_button = Image.load("../images/red_button.png") #モード選択ボタン-vs_angel-
$green_button = Image.load("../images/green_button.png") #モード選択ボタン-tutorial-

#モード選択ボタンアクセサリー画像
$tutorial_accessory_A = Image.load("../images/tutorial_accessory_A.png") #tutorial用のアクセサリー
$tutorial_accessory_B = Image.load("../images/tutorial_accessory_B.png") #tutorial用のアクセサリー
$vs_angel_accessory_A = Image.load("../girl_images/vs_angel_image_A.png") #vs_angel用のアクセサリー
$vs_angel_accessory_B = Image.load("../girl_images/vs_angel_image_B.png") #vs_angel用のアクセサリー

#メニュー画面モード表記
$tutorial_image = Image.load("../images/tutorial_mode_image.png")
$vs_angel_image = Image.load("../images/vs_angel_mode_image.png")

$flag = Image.load("../images/flag_image.png") #フラッグ画像

#タイル目画像の分割設定(0:灰 1:白 2:赤 3:橙 4:緑 5:青 6:水 7:黄)
$field_tile = Image.load_tiles("../images/fieldtile.png",4,2)
$x = 150 #タイルの初期x座標
$y = 110 #タイルの初期y座標
$num1=0
loop do #タイルの表示sprite作成
    $num2=0
    $i=0
    loop do
        $num3=0
        loop do
            $tile[$i] = Sprite.new($num2*65+$x,$num3*65+$y,$field_tile[$num1])
            $num3 += 1
            $i += 1
            if $num3>4
                break
            end
        end
        $num2 += 1
        if $num2>4
            $color_tile.push($tile)
            $tile = []
            break
        end
    end
    $num1+=1
    if $num1>7
        break
    end
end


#ライフアイコンの分割設定(0:暗 1:明)
$life_image = Image.load_tiles("../images/life.jpg",2,1)
$life1 = Sprite.new(0,0,$life_image[1])
$life2 = Sprite.new(65,0,$life_image[1])
$life3 = Sprite.new(130,0,$life_image[1])

$life = [$life1,$life2,$life3]

$lost_life1 = Sprite.new(0,0,$life_image[0])
$lost_life2 = Sprite.new(65,0,$life_image[0])
$lost_life3 = Sprite.new(130,0,$life_image[0])

$lost_life = [$lost_life1,$lost_life2,$lost_life3]

#宝物センサーの分割設定(0:灰 1:白 2:赤 3:橙 4:緑 5:青 6:水 7:黄)
$censor_image = Image.load_tiles("../images/game_censor.png",4,2)
$num1=0
loop do #宝物センサー描写ループ
    $num2=0
    $i=0
    loop do
        $num3=0
        if $num2==0 #上
            $x=160
            $y=65
            loop do
                $i=10+10*$num2+1+$num3
                $censor[$i] = Sprite.new($num3*65+$x,$y,$censor_image[$num1])
                $num3 += 1
                if $num3>4
                    break
                end
            end
        elsif $num2==1 #右
            $x=475
            $y=120
            loop do
                $i=10+10*$num2+1+$num3
                $censor[$i] = Sprite.new($x,$num3*65+$y,$censor_image[$num1])
                $num3 += 1
                if $num3>4
                    break
                end
            end
        elsif $num2==2 #下
            $x=160
            $y=435
            loop do
                $i=10+10*$num2+1+$num3
                $censor[$i] = Sprite.new($num3*65+$x,$y,$censor_image[$num1])
                $num3 += 1
                if $num3>4
                    break
                end
            end
        elsif $num2==3 #左
            $x=105
            $y=120
            loop do
                $i=10+10*$num2+1+$num3
                $censor[$i] = Sprite.new($x,$num3*65+$y,$censor_image[$num1])
                $num3 += 1
                if $num3>4
                    break
                end
            end
        else
            $color_censor.push($censor)
            $censor = []
            break
        end
        $num2+=1
    end
    $num1+=1
    if $num1>7
        break
    end
end

#最初のstep0とstep1の時のシャドー
$black = Image.new(640,640,[0,0,0])

#pause時のメニューウィンドウ
$window_imageA = Image.new(332,235,[255,255,255]) #415,140,
$window_imageB = Image.new(328,231,[0,0,0]) #411,136,
$pause_window_A = Sprite.new(153,235,$window_imageA) #112.5,250
$pause_window_B = Sprite.new(155,237,$window_imageB) #155,252
#pause時の選択ボタンの表示エフェクト
$magenta = Image.new(328,50,[255,0,140])

#ヘルプ画面
$help_windowA = Image.new(404,542,[255,255,255])
$help_windowB = Image.new(400,538,[0,0,0])
$help_image1 = Image.load("../images/help1.png")
$help_image2 = Image.load("../images/help2.png")
$help = 0 #ヘルプ変数
$help_window_imageA = Sprite.new(117,73,$help_windowA)
$help_window_imageB = Sprite.new(119,75,$help_windowB)
$help_imageA = Sprite.new(119,75,$help_image1)
$help_imageB = Sprite.new(119,75,$help_image2)
#ヘルプのページボタンの反応エフェクト
$white_box = Image.new(40,40,[255,255,255])
$button_helpA = Image.new(100,53,[255,255,255]) #白色ボタン
$button_helpB = Image.new(96,49,[0,0,0]) #黒色ボタン

#天使のsprite登録
$normal_girl = Image.load("../girl_images/normal_face.png")
$girl = Sprite.new(400,420,$normal_girl)
$winface_girl = Image.load("../girl_images/winface_normal.png")
$winface_girl2 = Image.load("../girl_images/winface_finish.png")
$loseface_girl = Image.load("../girl_images/loseface_finish.png")

#吹き出し
$coment_image = Image.load("../images/coment.png")
$coment = Sprite.new(20,480,$coment_image)

#チュートリアル ソナー反応による宝タイルエリアを示す斜線
$slash = Image.load("../images/slash_line.png")
$slashline = Sprite.new(0,0,$slash, :z=>5)
$circle1 = Image.load("../images/circle.png")


require_relative "./tutorial"
require_relative "./VS_angel"
require_relative "./sonar   "

Window.loop do
    $msx=Input.mouse_pos_x #マウスカーソルのx座標
    $msy=Input.mouse_pos_y #マウスカーソルのy座標
    $back_screen.draw
    $menu_button.draw
    if $mode.include?("top_page")
        #Window.draw_font(200,10,"$msx:#{$msx} $msy:#{$msy} センサー#{$select_censor}",$font1, :z=>5)
        #タイトルアニメーション
        if $num1<=250
            $title_logo.y=$num1/10+35
            $title_logo.alpha=$num1
            $title_logo.draw
            $num1 += 3
        else
            $title_logo.draw
        end
        #チュートリアルモード
        if $msy>=375-$msx*44/321 && $msy<=580-$msx*42/307 && $msx<=321 && $msx>=0
            unless $mode.include?("pause") #pauseを含まない 
                Window.draw_scale(0,320,$green_button,1.1,1.1,center_x=140,center_y=520,1)
                Window.draw_scale(0,320,$tutorial_accessory_B,1.1,1.1,center_x=140,center_y=520,1)
                Window.draw_ex(40,515,$tutorial_image,{scale_x:1.3,scale_y:1.3,angle:352,z:2})
                if Input.mousePush?(M_LBUTTON) #モード選択
                    unless $mode.include?("pause") #pauseを含まない
                        $mode.delete("top_page")
                        $mode.push("tutorial")
                        $num1=0
                    end
                end
            else #ポーズ時に画像を差し替えない
                Window.draw(0,290,$green_button)
                Window.draw(0,290,$tutorial_accessory_A)
                Window.draw_ex(40,505,$tutorial_image,{angle:352,z:2})
            end
        else
            Window.draw(0,290,$green_button)
            Window.draw(0,290,$tutorial_accessory_A)
            Window.draw_ex(40,505,$tutorial_image,{angle:352,z:2})
        end

        #vs_angelモード
        if $msy>=375-$msx*44/321 && $msy<=580-$msx*42/307 && $msx>=322 && $msx<=640
            unless $mode.include?("pause") #pauseを含まない 
                Window.draw_scale(-33,325,$red_button,1.1,1.1,center_x=140,center_y=520,1)
                Window.draw_scale(-33,325,$vs_angel_accessory_B,1.1,1.1,center_x=140,center_y=520,1)
                Window.draw_ex(380,465,$vs_angel_image,{scale_x:1.3,scale_y:1.3,angle:352,z:2})
                if Input.mousePush?(M_LBUTTON) #モード選択
                    unless $mode.include?("pause") #pauseを含まない
                        $mode.delete("top_page")
                        $mode.push("VS_angel")
                        $num1=0
                    end
                end
            else #ポーズ時に画像を差し替えない
                Window.draw(0,290,$red_button)
                Window.draw(0,290,$vs_angel_accessory_A)
                Window.draw_ex(380,455,$vs_angel_image,{angle:352,z:2})
            end
        else
            Window.draw(0,290,$red_button)
            Window.draw(0,290,$vs_angel_accessory_A)
            Window.draw_ex(380,455,$vs_angel_image,{angle:352,z:2})
        end
    end


    if Input.mousePush?(M_LBUTTON)
        #一時停止・メニューボタン起動
        unless $mode.include?("pause") #pauseを含まない 
            if $msx>=580 && $msx<=640 && $msy>=0 && $msy<=60
                $mode.push("pause")
            end
        end
    end
    
    if $mode.include?("tutorial")
        tutorial
    elsif $mode.include?("VS_angel")
        vs_angel
    end
        
    #ヘルプ機能
    if $mode.include?("help")
        $help_window_imageA.z=6
        $help_window_imageB.z=6
        $help_imageA.z=6
        $help_imageB.z=6
        $help_window_imageA.draw
        $help_window_imageB.draw
        if $help==0
            $help_imageA.draw
            if $msx>=410 && $msx<=450 && $msy>=498 && $msy<=538
                Window.draw_alpha(410,498,$white_box,150,7)
                if Input.mousePush?(M_LBUTTON)
                    $help=1
                end
            end
        end
        if $help==1
            $help_imageB.draw
            if $msx>=190 && $msx<=230 && $msy>=498 && $msy<=538
                Window.draw_alpha(190,498,$white_box,150,7)
                if Input.mousePush?(M_LBUTTON)
                    $help=0
                end
            end
        end
        #ヘルプ終了ボタン
        Window.draw(270,550,$button_helpA,7)
        if $msx>=270 && $msx<=370 && $msy>=550 && $msy<=602
            Window.draw_font(280,557,"とじる",$font3,{:color=>[0,0,0], :z=>7})
            if Input.mousePush?(M_LBUTTON)
                $mode.delete("help")
            end
        else
            Window.draw(272,552,$button_helpB,7)
            Window.draw_font(280,557,"とじる",$font3, :z=>7)
        end
    end

    if $mode.include?("pause")
        Window.draw_alpha(0,0,$black,175,4)
        $pause_window_A.z=4
        $pause_window_A.alpha=200
        $pause_window_B.z=4
        $pause_window_B.alpha=230
        $pause_window_A.draw
        $pause_window_B.draw
        Window.draw_font(237,190,"ポーズメニュー",$font3, :z=>5)
        Window.draw_font(277,255,"続ける",$font3, :z=>5)
        Window.draw_font(252,305,"リスタート",$font3, :z=>5)
        Window.draw_font(252,360,"操作ヘルプ",$font3, :z=>5)
        Window.draw_font(227,415,"メニュー画面へ",$font3, :z=>5)

        if $msx>=156 && $msx<=484
            if $msy>=245 && $msy<=295 #ポーズ画面解除
                Window.draw(156,245,$magenta,4)
                unless $mode.include?("help") #help表示中の誤操作防止
                    if Input.mousePush?(M_LBUTTON)
                        $mode.delete("pause")
                    end
                end
            elsif $msy>=300 && $msy<=350 #リスタート
                Window.draw(156,300,$magenta,4)
                unless $mode.include?("help") #help表示中の誤操作防止
                    if Input.mousePush?(M_LBUTTON)
                        if $mode.include?("VS_angel")
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
                            $num1 = 0
                            $mode.delete("pause")
                        elsif $mode.include?("tutorial")
                            $alive_tile_tutorial = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                            $ban_tile_tutorial = [3,0,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
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
                            $ok = 0
                            $num6 = 0
                            $num7 = 0
                            $num1 = 0
                            $mode.delete("pause")
                        elsif $mode.include?("top_page")
                            $num1 = 0
                            $mode.delete("pause")
                        end
                    end
                end
            elsif $msy>=355 && $msy<=405 #操作ヘルプ
                Window.draw(156,355,$magenta,4)
                unless $mode.include?("help") #help表示中の誤操作防止
                    if Input.mousePush?(M_LBUTTON)
                        $mode.push("help")
                        $help=0
                    end
                end
            elsif $msy>=410 && $msy<=460 #メニュー画面へ
                Window.draw(156,410,$magenta,4)
                unless $mode.include?("help") #help表示中の誤操作防止
                    if Input.mousePush?(M_LBUTTON)
                        if $mode.include?("VS_angel")
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
                            $num1 = 0
                        elsif $mode.include?("tutorial")
                            $mode.delete("pause")
                            $mode.delete("tutorial")
                            $mode.push("top_page")
                            $alive_tile_tutorial = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] #選択可能タイルの配列
                            $ban_tile_tutorial = [3,0,25,25,25,25] #宝物タイル＆選択禁止タイル配列 (25は仮置き)
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
                            $ok = 0
                            $num6 = 0
                            $num7 = 0
                            $num1 = 0
                        elsif $mode.include?("top_page")
                            $num1 = 0
                            $mode.delete("pause")
                        end
                    end
                end
            end
        end
    end
end