
-- The lines below should be commented in production version 
require "candles"
getIndicatorValue = candles.getIndicatorValue
-- *************************************************************

local candlePatterns = {}

function readOptionalArguments( ... )
	local confirmTrend = 2
	local candleIndex = 0

	for k,v in ipairs{...} do
		if k == 1 then
			confirmTrend = v 
		end
		if k == 2 then
			candleIndex = v 
		end
	end

	return confirmTrend, candleIndex
end


function isHaramiBearish( _timeFrame, ... )

	_confirmBullishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBullishTrend( _candleIndex + 2, _confirmBullishCandles, _timeFrame ) == false then
		return false
	end

	local candle0 = readCandle( _candleIndex, _timeFrame )
	if candle0 == nil then
		return false
	end
	local candle1 = readCandle( _candleIndex + 1, _timeFrame )
	if candle1 == nil then
		return false
	end

	if not (candle1.close > candle1.open) then
		return false
	end
	if not (candle1.open < candle0.min) then
		return false
	end
	if not (candle1.max > candle0.max) then
		return false
	end
	if not (candle0.close <= candle0.open) then
		return false
	end

	return true
end


function isHaramiBullish( _timeFrame, ... )

	_confirmBearishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBearishTrend( _candleIndex + 2, _confirmBearishCandles, _timeFrame ) == false then
		return false
	end

	local candle0 = readCandle( _candleIndex, _timeFrame )
	if candle0 == nil then
		return false
	end
	local candle1 = readCandle( _candleIndex + 1, _timeFrame )
	if candle1 == nil then
		return false
	end

	if not (candle1.close < candle1.open) then -- 
		return false
	end
	if not (candle1.open > candle0.max) then
		return false 
	end
	if not (candle1.min < candle0.min ) then
		return false
	end
	if not (candle0.close >= candle0.open ) then
		return false
	end

	return true
end


function isEngulfingBearish( _timeFrame, ... )

	_confirmBullishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBullishTrend( _candleIndex + 2, _confirmBullishCandles, _timeFrame ) == false then
		return false
	end

	local candle0 = readCandle( _candleIndex, _timeFrame )
	if candle0 == nil then
		return false
	end
	local candle1 = readCandle( _candleIndex + 1, _timeFrame )
	if candle1 == nil then
		return false
	end

	if not (candle0.close < candle0.open) then -- 
		return false
	end
	if not (candle0.max > candle1.max) then
		return false 
	end
	if not (candle1.min > candle0.close ) then
		return false
	end
	if not (candle1.close >= candle1.open ) then
		return false
	end

	return true
end


function isEngulfingBullish( _timeFrame, ... )

	_confirmBearishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBearishTrend( _candleIndex + 2, _confirmBearishCandles, _timeFrame ) == false then
		return false
	end

	local candle0 = readCandle( _candleIndex, _timeFrame )
	if candle0 == nil then
		return false
	end
	local candle1 = readCandle( _candleIndex + 1, _timeFrame )
	if candle1 == nil then
		return false
	end

	if not (candle0.close > candle0.open) then -- 
		return false
	end
	if not (candle0.min > candle1.min) then
		return false 
	end
	if not (candle1.max < candle0.close ) then
		return false
	end
	if not (candle1.close <= candle1.open ) then
		return false
	end
	return true
end


function isShootingStar( _timeFrame, _tailLengthPct, ... )

	if _tailLengthPct == nil then
		_tailLengthPct = 66
	end

	_confirmBullishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBullishTrend( _candleIndex + 1, _confirmBullishCandles, _timeFrame ) == false then
		return false
	end

	local candle = readCandle( _candleIndex, _timeFrame )
	if candle == nil then
		return false
	end

	if candle.max == candle.min then
		return false
	end
	if math.min( candle.open, candle.close ) - candle.min > (candle.max - candle.min) * 0.01 then
		return false
	end
	if math.abs(candle.open - candle.close) > ( (100.0 - _tailLengthPct) / 100.0 ) * (candle.max - candle.min) then
		return false
	end

	return true
end


function isHangingMan( _timeFrame, _bodyLengthPct, ... )

	if _bodyLengthPct == nil then
		_bodyLengthPct = 66
	end

	_confirmBullishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBullishTrend( _candleIndex + 1, _confirmBullishCandles, _timeFrame ) == false then
		return false
	end

	local candle = readCandle( _candleIndex, _timeFrame )
	if candle == nil then
		return false
	end

	if candle.max == candle.min then
		return false
	end
	if candle.max - math.max( candle.open, candle.close ) > (candle.max - candle.min) * 0.01 then
		return false
	end
	if math.abs(candle.open - candle.close) > ( (100.0 - _bodyLengthPct) / 100.0 ) * (candle.max - candle.min) then
		return false
	end

	return true
end


function isHammer( _timeFrame, _handleLengthPct, ... )

	if _handleLengthPct == nil then
		_handleLengthPct = 66
	end

	_confirmBearishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBearishTrend( _candleIndex + 1, _confirmBearishCandles, _timeFrame ) == false then
		return false
	end

	local candle = readCandle( _candleIndex, _timeFrame )
	if candle == nil then
		return false
	end

	if candle.max == candle.min then
		return false
	end
	if candle.max - math.max( candle.open, candle.close ) > (candle.max - candle.min) * 0.01 then
		return false
	end
	if math.abs(candle.open - candle.close) > ( (100.0 - _handleLengthPct) / 100.0 ) * (candle.max - candle.min) then
		return false
	end

	return true
end


function isInvertedHammer( _timeFrame, _handleLengthPct, ... )

	if _handleLengthPct == nil then
		_handleLengthPct = 66
	end

	_confirmBearishCandles, _candleIndex = readOptionalArguments(...)

	if confirmBearishTrend( _candleIndex + 1, _confirmBearishCandles, _timeFrame ) == false then
		return false
	end

	local candle = readCandle( _candleIndex, _timeFrame )
	if candle == nil then
		return false
	end

	if candle.max == candle.min then
		return false
	end
	if math.min( candle.open, candle.close ) - candle.min > (candle.max - candle.min) * 0.01 then
		return false
	end
	if math.abs(candle.open - candle.close) > ( (100.0 - _handleLengthPct) / 100.0 ) * (candle.max - candle.min) then
		return false
	end

	return true
end


function confirmBullishTrend( _startCandle, _numCandles, _timeFrame )
	local numBearishAllowedPct = 20 

	local numBullish=0
	local numBearish=0

	if _numCandles == nil then
		return true
	end
	if _numCandles == 0 then
		return true
	end

	local lastClose
	local firstOpen
	local endCandle = _startCandle+_numCandles-1
	for i = _startCandle, endCandle do
		local candle = readCandle( i, _timeFrame )
		if candle == nil then
			return false
		end
		if candle.close < candle.open then
			numBearish = numBearish + 1
		else
			numBullish = numBullish + 1
		end

		if i == _startCandle then
			lastClose = candle.close
		end
		if i == endCandle then
			firstOpen = candle.open
		end
	end

	if not (lastClose > firstOpen) then
		return false
	end

	if math.floor( 100.0 * numBearish / _numCandles ) > numBearishAllowedPct then
		return false
	end

	return true
end


function confirmBearishTrend( _startCandle, _numCandles, _timeFrame )
	local numBullishAllowedPct = 20 

	local numBullish=0
	local numBearish=0

	if _numCandles == nil then
		return true
	end
	if _numCandles == 0 then
		return true
	end

	local lastClose
	local firstOpen
	local endCandle = _startCandle+_numCandles-1
	for i = _startCandle, endCandle do
		local candle = readCandle( i, _timeFrame )
		if candle == nil then
			return false
		end
		if candle.close > candle.open then
			numBullish = numBullish + 1
		else
			numBearish = numBearish + 1
		end

		if i == _startCandle then
			lastClose = candle.close
		end
		if i == endCandle then
			firstOpen = candle.open
		end
	end

	if not (lastClose < firstOpen) then
		return false
	end

	if math.floor( 100.0 * numBullish / _numCandles ) > numBullishAllowedPct then
		return false
	end

	return true
end

function proofCandle( _candleOpen, _candleMax, _candleMin, _candleClose )

	if _candleOpen == nil or _candleMax == nil or _candleMin == nil or _candleClose == nil then
		return nil
	end

	local candleOpen = tonumber( _candleOpen )
	if candleOpen == nil then
		return nil
	end
	local candleMax = tonumber( _candleMax )
	if candleMax == nil then
		return nil
	end
	local candleMin = tonumber( _candleMin )
	if candleMin == nil then
		return nil
	end
	local candleClose = tonumber( _candleClose )
	if candleClose == nil then
		return nil
	end

	return { open=candleOpen, min=candleMin, max=candleMax, close=candleClose }
end

function readCandle( _candleIndex, _timeFrame )

	local candle = getIndicatorValue( "NewCandle_".._timeFrame, _candleIndex )
	if candle == nil then
		return nil
	end

	local proofed = proofCandle( candle.open, candle.max, candle.min, candle.close )
	-- print( proofed.open ..",".. proofed.max ..",".. proofed.min ..",".. proofed.close )
	return proofed
end

candlePatterns.isHaramiBearish = isHaramiBearish
candlePatterns.isHaramiBullish = isHaramiBullish
candlePatterns.isEngulfingBearish = isEngulfingBearish
candlePatterns.isEngulfingBullish = isEngulfingBullish
candlePatterns.isShootingStar = isShootingStar
candlePatterns.isHangingMan = isHangingMan
candlePatterns.isHammer = isHammer
candlePatterns.isInvertedHammer = isInvertedHammer

return candlePatterns


