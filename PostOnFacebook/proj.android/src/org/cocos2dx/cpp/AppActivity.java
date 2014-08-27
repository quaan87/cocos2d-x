/****************************************************************************
Copyright (c) 2008-2010 Ricardo Quesada
Copyright (c) 2010-2012 cocos2d-x.org
Copyright (c) 2011      Zynga Inc.
Copyright (c) 2013-2014 Chukong Technologies Inc.
 
http://www.cocos2d-x.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
package org.cocos2dx.cpp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.cocos2dx.lib.Cocos2dxActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;

public class AppActivity extends Cocos2dxActivity {
	public static AppActivity _appActiviy = null;
	@Override
	protected void onCreate(Bundle pSavedInstanceState) {
		super.onCreate(pSavedInstanceState);
		_appActiviy = this;
	}
	// share
	public static void postOnFacebook() {
		Intent intent = new Intent();
		intent.setAction(Intent.ACTION_SEND);
		
//		intent.putExtra(intent.EXTRA_TEXT, "Test stt");
//		intent.setType("text/plain");
		
		File dirFiles = _appActiviy.getFilesDir();
		String fileName = null;
		for (String strFile : dirFiles.list())
		{
		 // strFile is the file name
			fileName = strFile;
		}
		String filePath = null;
		filePath = dirFiles + "/" + fileName;
		Log.e("filePath", filePath);
		
		File ruta_sd = Environment.getExternalStorageDirectory();
		File dirTo = new File(ruta_sd.getAbsolutePath(), "Screen.png");
		String fileTo = null;
		fileTo = dirTo + "";
		
		copyFile(filePath, fileTo);
		
		Log.e("pathTo", fileTo);
		
		intent.putExtra(intent.EXTRA_STREAM, Uri.fromFile(new File(fileTo)));
		intent.setType("image/png");
		_appActiviy.startActivity(Intent.createChooser(intent, "Share via"));
	}
	public static boolean copyFile(String from, String to) {
	    try {
	        int bytesum = 0;
	        int byteread = 0;
	        File oldfile = new File(from);
	        if (oldfile.exists()) {
	            InputStream inStream = new FileInputStream(from);
	            FileOutputStream fs = new FileOutputStream(to);
	            byte[] buffer = new byte[1444];
	            while ((byteread = inStream.read(buffer)) != -1) {
	                bytesum += byteread;
	                fs.write(buffer, 0, byteread);
	            }
	            inStream.close();
	            fs.close();
	        }
	        return true;
	    } catch (Exception e) {
	        return false;
	    }
	}
}
