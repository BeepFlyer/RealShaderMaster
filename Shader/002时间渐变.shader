Shader "RealShaderMaster/Basic/002colorChangeTime"{ //随时间渐变
    Properties{
        _Speed("Speed",float) = 1.0 //控制变化速度
        _Light("Light",float) = 1.0 //控制亮度

        }

    SubShader {
        Pass{
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float _Speed;
            float _Light;

            struct CC_v2f{
                float4 position:SV_POSITION;
                float2 uv:TEXCOORD0;
                };

            CC_v2f  vert (appdata_base v){
                CC_v2f  o;
                o.position = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;
                return o;
            }

            float4 frag(CC_v2f i):SV_Target{
                float t =  _Light* ( sin(_Time.y*_Speed)*0.5+0.5 );
                float t2 =  _Light*( cos(_Time.y*_Speed)*0.5+0.5 );
                return float4(i.uv.x*t,i.uv.y*t2,0,1);
            }

            ENDCG
        }
    }
}
