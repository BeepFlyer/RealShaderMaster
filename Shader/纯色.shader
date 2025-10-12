Shader "RealShaderMaster/Basic/pureColor"{ //纯色
    Properties{
        _Result("MyColor",Color)=(0,1,0,1)
        }


    SubShader {
        Pass{
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            float4 _Result;

            float4 vert (float4 v : POSITION):SV_POSITION{
                return UnityObjectToClipPos(v);
            }

            float4 frag():SV_Target{
                return _Result;
            }

            ENDCG
        }
    }
}
