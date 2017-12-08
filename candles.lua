-- For testing

candles = {}

function generateCandles()
	local max
	local min
	local open
	local close
	for i = 20000, 1, -1 do		 
		if i < 2000 then
			open = close
		else
			open = 10000
		end
		max = open + (math.random(20) - 1)
		min = open - (math.random(20) - 1)
		close = min + math.random(max-min+1) - 1
		candles[i] = { max=max, min=min, open=open, close=close }
	end
	return candles
end


function getIndicatorValue( _name, _index )
	return candles[_index+1]
end


candles.generateCandles = generateCandles
candles.getIndicatorValue = getIndicatorValue

return candles