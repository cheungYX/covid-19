require "json"

f = File.open("./data.json", "r")
co = File.open("covid.json", 'a')
@data = JSON.load(f)

@data['features'].each do |q|
    meta = { 
        'index' => {
            '_index' => 'covid_19',
             '_id'   => q['id']
        } 
    }
    field = {
        "location"         => q['geometry']['coordinates'],
        "Gender"           => q['properties']['Gender'],
        "Hospital_Pref"    => q['properties']['Hospital_Pref'],
        "PCR検査実施人数"    => q['properties']['PCR検査実施人数'].to_i,
        "PCR検査前日比"      => q['properties']['PCR検査前日比'].to_i,
        "Release"          => q['properties']['Release'],
        "Residential_Pref" => q['properties']['Residential_Pref'],
        "X"                => q['properties']['X'],
        "Y"                => q['properties']['Y'],
        "キー"              => q['properties']['キー'],
        "ステータス"         => q['properties']['ステータス'],
        "ソース"            => q['properties']['ソース2'],
        "ソース2"           => q['properties']['ソース3'],
        "ソース3"           => q['properties']['チャーター便'],
        "チャーター便"       => q['properties']['チャーター便'],
        "確定日"            => q['properties']['確定日'].to_s[0,10],
        "確定日YYYYMMDD"    => Time.at(q['properties']['確定日YYYYMMDD'].to_s[0,10].to_i).strftime("%Y-%m-%d %H:%M:%S"),
        "居住管内"           => q['properties']['居住管内'],
        "居住市区町村"       => q['properties']['居住市区町村'],
        "居住都道府県"       => q['properties']['居住都道府県'],
        "居住都道府県コード"  => q['properties']['居住都道府県コード'].to_i,
        "勤務先_正誤確認用"   => q['properties']['勤務先_正誤確認用'],
        "厚労省NO"          => q['properties']['厚労省NO'].to_i,
        "更新日時"           => q['properties']['更新日時'],
        "国内"              => q['properties']['国内'],
        "死者合計"           => q['properties']['死者合計'].to_i,
        "受診都道府県"       => q['properties']['受診都道府県'],
        "受診都道府県コード"  => q['properties']['受診都道府県コード'].to_i,
        "職業_正誤確認用"     => q['properties']['職業_正誤確認用'],
        "人数"              => q['properties']['人数'].to_i,
        "性別"              => q['properties']['性別'],
        "前日比"            => q['properties']['前日比'].to_i,
        "退院数"            => q['properties']['退院数'].to_i,
        "退院数累計"         => q['properties']['退院数累計'].to_i,
        "通し"              => q['properties']['通し'].to_i,
        "都道府県内症例番号"  => q['properties']['都道府県内症例番号'].to_i,
        "年代"              => q['properties']['年代'][0,2].to_i,
        "発症数"            => q['properties']['発症数'].to_i,
        "発症日"            => Time.at(q['properties']['発症日'].to_s[0,10].to_i).strftime("%Y-%m-%d %H:%M:%S"),
        "発表"              => q['properties']['発表'],
        "備考"              => q['properties']['備考'],
        "無症状病原体保有者"  => q['properties']['無症状病原体保有者'],
        "累計"              => q['properties']['累計'].to_i,
        "ObjectId"          => q['properties']['ObjectId'].to_i
    }
    JSON.dump(meta, co)
    co.print "\n"
    JSON.dump(field, co)
    co.print "\n"
end
