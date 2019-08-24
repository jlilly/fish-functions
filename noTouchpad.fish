# Defined in - @ line 2
function noTouchpad --description 'Disable Touchpad on the Dell Percision 7510'
	xinput disable 'DLL07B0:01 044E:120B'
end
