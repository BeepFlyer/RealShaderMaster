Shader "RealShaderMaster/Basic/003texture"{ //随时间渐变
    Properties{
            _Tex("Texture",2D)="white"{}
        }

    SubShader {
        Pass{
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f{
                float4 pos:SV_POSITION;    
                float2 uv:TEXCOORD0;
            };

            //TEXTURE2D(_Tex);
            //SAMPLER(sampler_Tex);
            sampler2D _Tex;  



            v2f vert (appdata_base v){
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.texcoord;
                return o;
            }

            float4 frag(v2f i):SV_Target{
                //return _Tex.Sample(sampler_Tex,i.uv);
                return tex2D(_Tex, i.uv); // ✅ Built-in 正确采样函数

            }

            ENDCG
        }
    }
}

//Built-In shader有些过时了
/*
Unity未来也不维护Built-In shader了
而是选用URP和HURP
他们都属于SRP，全过程可以编程的管线
不同的管线有着不同的函数库
比如Built-In shader用的是UnityCG.cginc
URP用的是Core，而且用的是HLSL语言
Built-In shader再学没啥意义
冯乐乐的Unity Shader入门精要有些过时了
感觉还是要学URP

不同语言之间的变量导来导去真的很烦
我想之后试试用shader Graph来写写URP

通过shader graph来入门，后面再深入了解代码什么的
*/