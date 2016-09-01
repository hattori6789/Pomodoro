#coding: UTF-8
exportFileName = "pomodoroLog.txt"
exportFilePath = "~/Desktop/Pomodoro/"

toDo = ARGV[0]
timer = ARGV[1].to_i

if toDo == nil
  puts "何をしますか？"
  toDo = gets.chomp
  puts "何分間しますか？（Default 25分）"
  timer = gets.to_i
end

if timer == 0
  timer = 25
end

def getPointTime(time)
  t = Time.now
  startPoint = t.strftime("%Y/%m/%d %H:%M:%S")
  endingPoint = (t + time * 60).strftime("%Y/%m/%d %H:%M:%S")
  return startPoint, endingPoint
end

startPoint, endingPoint = getPointTime(timer)

# 標準出力、一時停止、terminalで実行、ファイルへ作業時間の書き込み、ファイルを展開、PCのスリープ
puts "#{startPoint} Settime: #{timer} min"
sleep timer * 60
exec("echo '#{startPoint} Start #{toDo}\n#{endingPoint} #{timer} min passed.' >> #{exportFilePath + exportFileName}
echo 'It will sleep after 10 sec.'
open #{exportFilePath + exportFileName}
sleep 10
pmset sleepnow")
