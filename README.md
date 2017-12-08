A lua library to recognize candlestick patterns at price charts 
===================================================================================
version 0.0.1
    
> **Important notice**:
> Nothing important yet... :)

## CONTENTS / СОДЕРЖАНИЕ ##
[isHaramiBearish](#isharamibearish) - Harami Bearish.  
[isHaramiBullish](#isharamibullish) - Harami Bullish.  
[isEngulfingBearish](#isengulfingbearish) - Engulfing Bearish.  
[isEngulfingBullish](#isengulfingbullish) - Engulfing Bullish.  
[isShootingStar](#isshootingstar) - Shooting Star.   
[isHangingMan](#ishangingman) - Hanging Man.   
[isHammer](#ishammer) - Hammer.   
[isInvertedHammer](#isinvertedhammer) - Inverted Hammer.   

----------

### isHaramiBearish ###
Returns **true** when recognizes Harami Bearish pattern.

```lua
isHaramiBearish( _timeFrame, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bullish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isHaramiBullish ###
Returns **true** when recognizes Harami Bullish pattern.
```lua
isHaramiBullish( _timeFrame, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bearish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 

### isEngulfingBearish ###
Returns **true** when recognizes Engulfing Bearish pattern.

```lua
isEngulfingBearish( _timeFrame, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bullish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isEngulfingBullish ###
Returns **true** when recognizes Engulfing Bullish pattern.
```lua
isEngulfingBullish( _timeFrame, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bearish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isShootingStar ###
Returns **true** when recognizes the Shooting Star pattern.
```lua
isShootingStar( _timeFrame, _tailLengthPct, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _tailLengthPct (integer,  defaut:66) - The length of the 'tail' of the 'star' in pct.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bullish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isHanginMan ###
Returns **true** when recognizes the Hanging Man pattern.
```lua
isHanginMan( _timeFrame, _bodyLengthPct, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _bodyLengthPct (integer,  defaut:66) - The length of the 'body' of the 'hanging man' in pct.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bullish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isHammer ###
Returns **true** when recognizes the Hammer pattern.
```lua
isHammer( _timeFrame, _handleLengthPct, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _bodyLengthPct (integer,  defaut:66) - The length of the 'handle' of the 'hammer' in pct.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bearish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 


### isInvertedHammer ###
Returns **true** when recognizes the Inverted Hammer pattern.
```lua
isInvertedHammer( _timeFrame, _handleLengthPct, _confirmTrend, _index )
```
    _timeFrame (integer) - Time frame for candles
    _bodyLengthPct (integer,  defaut:66) - The length of the 'handle' of the 'hammer' in pct.
    _confirmTrend (integer, default:2, optional) - The number of candles to review 
    to confirm preceeding bearish trend.
    _index (integer, default:0, optional) - The candle index to find the pattern at. 