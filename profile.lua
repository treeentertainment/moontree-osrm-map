-- profile.lua 예제 (차량 경로를 설정하는 기본 프로파일 예시)
-- 차량 속도, 제한 사항 등은 필요에 따라 조정합니다
local speed_profile = {
    ["highway"] = {
        ["motorway"] = 90,
        ["trunk"] = 85,
        ["primary"] = 65,
        ["secondary"] = 55,
        ["tertiary"] = 40,
        ["unclassified"] = 25,
        ["residential"] = 15,
    }
}

function way_function(way)
    -- 속도와 제한을 설정
    local highway = way:get_value_by_key("highway")
    local maxspeed = way:get_value_by_key("maxspeed")
    if highway and speed_profile[highway] then
        way.speed = speed_profile[highway]
    end
end
