
-- ******************************************************************************************************
-- Testing

cp = require "candle_patterns"
cn = require "candles"

function printCandle( _index )
	candle = cn.getIndicatorValue("", _index)
	print( string.format("o=%.0f h=%.0f l=%.0f c=%.0f shadow=%.0f, body=%.0f", 
		candle.open, candle.max, candle.min, candle.close, candle.max-candle.min, candle.close-candle.open) )
end

for i=1,20 do

	candles = cn.generateCandles()

	for j = 0,10 do

		if cp.isHaramiBearish( 1, 0 ) then
			print "harami bearish"
			printCandle(0)
			printCandle(1)
		end

		if cp.isHaramiBullish( 1, 0 ) then
			print "harami bullish"
			printCandle(0)
			printCandle(1)
		end

		if cp.isEngulfingBearish( 1, 0 ) then
			print "engulfing bearish"
			printCandle(0)
			printCandle(1)
		end

		if cp.isEngulfingBullish( 1, 0 ) then
			print "engulfing bullish"
			printCandle(0)
			printCandle(1)
		end		

		if cp.isShootingStar( 1, nil, 0 ) then
			print "shooting star"
			printCandle(0)
		end

		if cp.isHangingMan( 1, nil, 0 ) then
			print "hanging man"
			printCandle(0)
		end

		if cp.isHammer( 1, nil, 0 ) then
			print "hammer"
			printCandle(0)
		end

		if cp.isInvertedHammer( 1, nil, 0 ) then
			print "inverted hammer"
			printCandle(0)
		end
	end
end



--[[
	if candle.open == nil or candle.min == nil or candle.max == nil or candle.close == nil then
		return nil
	end

	local candleOpen = tonumber( candle.open )
	if candleOpen == nil then
		return nil
	end
	local candleMin = tonumber( candle.min )
	if candleMin == nil then
		return nil
	end
	local candleMax = tonumber( candle.max )
	if candleMax == nil then
		return nil
	end
	local candleClose = tonumber( candle.close )
	if candleClose == nil then
		return nil
	end
	return { open=candleOpen, min=candleMin, max=candleMax, close=candleClose }
--]]