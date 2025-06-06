MATLAB mesh renderer code for Linux 
------------------------------------
In this package you will find the source code of a C++ mesh renderer to be used from MATLAB (mex file) using OpenSceneGraph
This renders textured 3D models (standard 3D file formats), using either sphere orientation (elevation , azimuth, and yaw) or camera matrix. 
Its output includes a rendered view of the textured model and its corresponding depth-map (inverse depth at each pixel). In addition, it provides an 'unproject' matrix which associates each pixel with the coordinates the 3D surface point projected onto that pixel.  
The result is not rendered on screen but returned to MATLAB as a matrix or saved directly to file. This makes the program suitable to be used either from a regular MATLAB session or from a console versions of MATLAB. It is also usefull in batch mode, in order to process many views / models directly from MATLAB.
OpenGL is used as the backend. 

Its key features include:

    Reads standard 3D CG file formats into MATLAB (.wrl, .obj, .3ds, etc.)
    Camera control using sphere orientation (elevation , azimuth, and yaw) or camera matrix
    Results rendered off-screen and returned as MATLAB matrices. It is therefore suitable for console versions of MATLAB, as well as batch processing of many views / models
    Outputs depth map (inverse depth at each pixel) along with rendered views; can be used with the MATLAB 'surf' function.
    Outputs an 'unproject' matrix, linking each pixel with the coordinates the 3D surface point projected onto that pixel; it is therefore ideal for calibration / pose estimation using a 3D model as reference.
    Along with the 'calib' function, can be used to compute pose from 2D-3D correspondences, and pose-adjust models to images (see below)
    3D model caching - repeated rendering of the same model automatically use cached data and do not involve re-loading / reading the CG file


This code was developed by Liav Assif and Tal Hassner, and was used in the following papers: 

T. Hassner, Viewing Real-World Faces in 3D, International Conference on Computer Vision (ICCV), Sydney, Austraila, Dec. 2013
T. Hassner, L. Assif, and L. Wolf, When Standard RANSAC is Not Enough: Cross-Media Visual Matching with Hypothesis Relevancy, Machine Vision and Applications (MVAP), Volume 25, Issue 4, Page 971-983, 2014


If you find this code useful, please add suitable references in your work to either (or both) of these papers.

The code is available from:
https://www.openu.ac.il/home/hassner/projects/poses/

Copyright 2013, Liav Assif and Tal Hassner

The SOFTWARE ("renderer" and \ or  "calib") is provided "as is", without any guarantee made as to its suitability or fitness for any particular use.  It may contain bugs, so use of this tool is at your own risk. We take no responsibility for any damage that may unintentionally be caused through its use.

QUICK START GUIDE
---------------------
Note: This is the Linux version. Visit the web site for Windows/OSX versions.

For MATLAB releases upto 2014a:
1. Download the latest version of the renderer.tar.gz and renderer-pre-compiled-libs.tar.gz. 
2. Let`s assume the download folder is /home/user/download.
3. Open a shell (e.g xterm)
    $ cd /home/user/download
    $ tar zxvf renderer.tar.gz
    $ tar zxvf renderer-pre-compiled-libs.tar.gz
    $ cd renderer
4. Edit ldlibMatlab.bash and set LIBS_PREFIX to the libraries folder, e.g.
    LIBS_PREFIX=/home/user/download/local
5. Run the script from the shell, e.g
    $ cd /home/user/download/renderer
    $ ./ldlibMatlab.bash
6. The script starts up MATLAB with the appropriate libraries. Next, using the following commands
    >> [depth, rendered]=renderer(300, 300, 'example.osg');
    >> figure, imshow(depth); figure, imshow(rendered);
    should display the result of the provided example mesh on screen.

If you already have OpenSceneGraph and Mesa 3D installed globally, steps 4. and 5. can be skipped.

For MATLAB release 2014b:
1. Download the latest version of the renderer.tar.gz
2. Let`s assume the download folder is /home/user/download.
3. Open a shell (e.g xterm)
    $ cd /home/user/download
    $ tar zxvf renderer.tar.gz
    rename R2014b_renderer.mexa64 into renderer.mexa64
4. Start MATLAB as usual (without using the ldlibMatlab script)
5. Next, using the following commands
    >> [depth, rendered]=renderer(300, 300, 'example.osg');
    >> figure, imshow(depth); figure, imshow(rendered);
    should display the result of the provided example mesh on screen.

Read the following sections and refer to the FAQ if something goes wrong.    

INSTALLATION
---------------
The code was tested on MATLAB releases 2009b - 2014b on Linux. Visit the web site for Windows/OSX versions.

The code depends on:
1. OpenSceneGraph, a high performance 3D graphics toolkit
http://www.openscenegraph.org/

2. OpenSceneGraph depends on the Coin3D library for several of its 3D formats. Some distributions of OpenSceneGraph might already contain Coin3D internally.
http://www.coin3d.org

3. OpenGL. Please make sure pbuffer support is compiled in the OpenGL implementation used. On Linux the Mesa (software) OpenGL implementation was used:
The Mesa 3D Graphics Library. An open-source implementation of the OpenGL specification.
http://www.mesa3d.org

Any use of this code must respect their respective licenses.

MATLAB releases upto (including) 2014a installation:
    A pre-compiled version of the mex file for Linux 64-bit, renderer.mexa64 is provided. Also, a pre-compiled version of the required libraries for these versions, renderer-pre-compiled-libs.tar.gz, can be downloaded separately from our site:
    https://www.openu.ac.il/home/hassner/projects/poses/

    The suggested folder structure (after unpacking):
    -- <RENDER_ROOT>
        -- renderer/
        -- local/
        -- local/lib/
        -- local/lib64/
        -- local/lib64/osgPlugins-2.8.1/
        -- local/Mesa-7.0.3/lib64/
        -- local/include/
        -- calib/ (if using the calib package as well)

    In order to be used from MATLAB the dependent libraries must be available to MATLAB, e.g. by modifying the LD_LIBRARY_PATH environment variable. There are several ways this can be achieved. The simplest way is to use the provided 'ldlibMatlab' scripts (ldlibMatlab.bash for BASH or ldlibMatlab.csh for TCSH/CSH) to start MATLAB (after modifying LIBS_PREFIX in these scripts to the appropriate locations). Other ways are possible and can be found in MATLAB's documentation (by editing .matlab7rc.sh Startup File, see http://www.mathworks.com/help/matlab/ref/matlablinux.html). 
    When errors occur this is most likely due to an incorrect libraries configuration. Please refer to the FAQ section for troubleshooting.

    The pre-compiled libraries seem to work well with both old distributions of Linux (CentOS 5) and new ones. They can also co-exist with newer versions of the libraries (for example if you have a global installation of a newer version of OpenSceneGraph).

MATLAB 2014b installation:
    MATLAB 2014b already contains all the dependant libraries so there is no need to install them. In fact they conflict with MATLAB's own OSG installation and cause it to crash. First try to rename R2014b_renderer.mexa64 into renderer.mexa64 and use it. There's also no need to use ldlibMatlab startup script, but simply start MATLAB as usual. 
    If the execution fails, obtain OpenSceneGraph 3 or later and refer to the compilation section. After compilation, in order to be used from MATLAB the dependent libraries must be available to MATLAB, e.g. by modifying the LD_LIBRARY_PATH environment variable. There are several ways this can be achieved. The simplest way is to use the provided 'ldlibMatlab' scripts (ldlibMatlab.bash for BASH or ldlibMatlab.csh for TCSH/CSH) to start MATLAB (after modifying LIBS_PREFIX in these scripts to the appropriate locations). Other ways are possible and can be found in MATLAB's documentation (by editing .matlab7rc.sh Startup File, see http://www.mathworks.com/help/matlab/ref/matlablinux.html). 
    When errors occur this is most likely due to an incorrect libraries configuration. Please refer to the FAQ section for troubleshooting.
    Note however that we haven't tested MATLAB 2014b as much as older versions of MATLAB so you might want to try and use older versions of MATLAB.

COMPILATION
---------------  
A pre-compiled version of the mex file, renderer.mexa64 is already provided for Linux 64-bit for MATLAB releases upto (including) 2014a. For MATLAB 2014b, R2014b_renderer.mexa64 is provided (rename it to renderer.mexa64).
It is best to try to use the pre-compiled version first. Please refer to the FAQ section for troubleshooting.

If needed, you can recompile the code.
For MATLAB releases 2009b - 2014a you can either download the dependant libraries from our site and also use them for compilation, or install the dependencies system-wide from your distribution repositories.
For MATLAB releases 2014b you should install the dependencies system-wide from your distribution repositories. While MATLAB 2014b provide its own version of OSG, it cannot be used for compilation.

Once all the dependencies are installes, run from MATLAB:
>> cd <RENDER_ROOT>/renderer/
>> compile_renderer(OPENGL_PATH_PFX,OSG_PATH_PFX)
OPENGL_PATH_PFX and OSG_PATH_PFX should be the path to the OpenGL and OpenSceneGraph libraries, e.g. '/usr'. The libraries are expected at OPENGL_PATH_PFX/lib, OSG_PATH_PFX/lib and the header files at OPENGL_PATH_PFX/include and OSG_PATH_PFX/include. 

If you've extracted the pre-compiled libraries in /home/user/download and they are at /home/user/download/local/ 
>> compile_renderer('/home/user/download/local/Mesa-7.0.3','/home/user/download/local/');

If only OSG is installed system-wide  
>> compile_renderer('/home/user/download/local/Mesa-7.0.3','/usr');

If OpenGL and OSG are both installed system-wide
>> compile_renderer('/usr','/usr');


USAGE
-------
The supported mesh files are the formats supported by OpenSceneGraph. While standard mesh files (e.g. .3DS, .WRL, .OBJ.) can be loaded by the renderer, best results are achieved by first exporting the mesh files to COLLADA DOM (using some external utilities) and then using OpenSceneGraph utilities (osgconv) to convert to its native .OSG format. Once this is done, the resulting .OSG file can be used by the renderer as well.

An example mesh file, example.osg, is provided for demonstration. It is public domain and originally from http://3dprint.nih.gov/discover/3dpx-000013


Usage (from MATLAB) - running renderer without any argument shows the following help:
	[depth_image, rendered_image, unproject, out_A, out_R, out_T]
	= renderer(width, height, filename, writefiles, lighting, sphere orientation (5 arguments)/camera orientation (3 arguments))
Most input and output parameters are optional.
width and height should be unsigned integers.
filename - the input mesh filename.
writefiles can be 0 (disabled, the default) or 1 (outputs depth image: depth.pgm and the rendered image: rendered.png).
	Preferably it should be disabled (0) and the output depth and rendered parameters can be further processed by MATLAB.
lighting should be 0 (disabled) or 1 (enabled).
sphere orientation are the following 5 arguments: distance, elevation , azimuth, yaw and degree order.
	distance - a number added to the (auto calculated) model's bounding sphere radius. 0 is usually suitable.
	elevation, azimuth and yaw are degrees. The camera position on the bounding sphere is specified using them.
	degree order - a string specifying the order, e.g. 'xyz, 'zxy' etc.
camera orientation are 3 arguments: A (intrinsic matrix), R and T (extrinsic)


Examples:
renderer(300,300,'example.osg');
	Performs the rendering. However, since no output parameters were passed nothing is returned.
renderer(300,300,'example.osg',1);
	Performs the rendering and writes data files (depth.pgm and rendered.png). Note that this is _not_ the preferred way of usage.
[depth, rendered]=renderer(300, 300, 'example.osg');
	Returns the depth matrix and rendered image to MATLAB. No output files are written. This is the preferred usage.
figure, imshow(depth); figure, imshow(rendered);
	Displays the results.
[depth, rendered, unproject, A, R, T]=renderer(300, 300, 'example.osg');
	Also returns the camera matrices - A,R and T as well as the unprojection matrix.
	Now 'unproject(125,149,1:3)' returns the world XYZ coordinate of the image point (x=148,y=124)
[depth, rendered, unproject, A, R, T]=renderer(300, 300, 'example.osg',0,0,0.5,10,20,30,'zxy');
	Renders the mesh with a distance of 0.5, an elevation of 10 degrees, azimuth of 20 degrees and yaw of 30 degrees.
[depth, rendered, unproject]=renderer(300, 300, 'example.osg',0,0,A,R,T);
	Providing the camera matrices returned from the previous example will yield the same results.
Animation example:
	for yaw=0:10:360
		[~, rendered]=renderer(300, 300, 'example.osg',0,0,0.5,10,20,yaw,'zxy'); 
		figure(1); imshow(rendered); pause;
	end
	Rotate in-plane by varying the yaw parameter. Each pressed key shows another frame of the animation
    
    
F.A.Q
-------

--- Technical issues ---

Q: I'm getting the following error: "Invalid MEX-file '/home/.../renderer.mexa64': libosg.so.55: cannot open shared object file: No such file or directory"
A: This is the most common error. The dependent libraries should be available in MATLAB. If you have installed the libraries globally (i.e. you are the system administrator), MATLAB can be started as usual. Alternatively, if you don't have such permissions, or prefer to use the provided per-compiled libraries, we have provided the example startup script (ldlibMatlab.bash or ldlibMatlab.csh). Just edit LIBS_PREFIX in the script to point to the libraries location, e.g. LIBS_PREFIX=/home/user/download/local
If you are still getting that error, make sure that <LIBS_PREFIX>/lib64/libosg.so.55 exist and all the extracted files permissions are valid (read/execute etc.). Permission problems could occur when using Windows archive extractors instead of the Unix 'tar' when extracting the .tar.gz files.
If the libraries exist and the permissions seem valid, try from MATLAB:
getenv('LD_LIBRARY_PATH')
The (local) libraries path should be part of the output, e.g. /home/user/download/local/lib.
If the problem persists, try to create and edit a local .matlab7rc.sh Startup File (see http://www.mathworks.com/help/matlab/ref/matlablinux.html). Set LDPATH_PREFIX there similarly as in the ldlibMatlab* script. Then start matlab directly from the same folder as .matlab7rc.sh, e.g. renderer/.
Another possible reason could be when matalb is executed by a different user than the one setting the environment variable (see the next question).
Please ask your system administrator for help if the issue is not resolved.

Q: I've modified the ldlibMatlab script to run MATLAB as 'sudo' and now I get runtime errors.
A: sudo does not pass the LD_LIBRARY_PATH variable. If you have root access then simply edit /etc/ld.so.conf.d (or equivalent) with the correct dependent libraries folders. Alternatively, use the .matlab7rc.sh approach.

Q: When trying to display the renderer output (e.g. imshow(rendered)), MATLAB crashes
A: This seems to occur on MATLAB R2014b. Refer to the installation notes regarding MATLAB R2014b.

Q: I've added all the libraries folders using addpath() but I still get runtime errors.
A: MATLAB's search path is irrelevant to the libraries path. You do not need to add them using addpath. 

Q: I'm getting the following message: "Warning: Could not find plugin to read objects from file "file.obj". ??? Error using ==> renderer Error: could not process file: file.obj"
A: 3D file handling is performed by OpenSceneGraph plugins. Similarly to the first question, make sure that <RENDER_ROOT>/lib64/osgPlugins-2.8.1/ is in the LD_LIBRARY_PATH environment variable. It is possible however that several formats are no longer supported (for example .WRL is not supported by default in OpenSceneGraph 3)
 
Q: How do I know if the 3D file I have is supported?
A: OpenSceneGraph has several binary utilities (which can be obtained from their site or any Linux distribution). One of them is 'osgviewer'. From the command line try for example:
$ osgviewer /path/to/myfile.3ds
and see if it is displayed on screen. If the format is not supported by OpenSceneGraph, it cannot be used by renderer as well.
In case you have the binaries installed, it is usually a good idea to always try it on the 3D file before reporting any problems with the renderer.

Q: Is there anything I can do if the 3D file I have is not supported?
A: You can try to export it to one of the supported formats using an external utility. 

Q: I have a complex/large 3D file which is not rendered correctly (even when using OSG's osgviewer binary)
A: OpenSceneGraph has a binary named 'osgconv' which can be used to convert between some of its supported formats. This might help in some cases. Exporting the file to COLLADA DOM (using some external utilities) and then using 'osgconv' in order to convert to its native .OSG format seems to work well for heavily textured and large 3D files (Google sketchup files etc.).

Q: When running doCalib() MATLAB crashes and this error appears at the console: "MKL ERROR: Parameter 5 was incorrect on entry to DGESDD"
A: Recent versions of MATLAB (> 2012a) have a LAPACK library which is not compatible with OpenCV 2.1. There are two possible solutions:
1. Recompile calib with OpenCV 2.3 or higher. This is the recommended solution.
2. Alternatively, use the LAPACK version used by OpenCV (system wide) instead of MATLAB's internal - use the following to launch MATLAB (replace /usr/lib64/liblapack.so.3 with the correct path):
env LAPACK_VERBOSITY=1 LAPACK_VERSION=/usr/lib64/liblapack.so.3 LD_LIBRARY_PATH=$LIBS_PREFIX/lib64:$LIBS_PREFIX/lib LD_PRELOAD=/usr/lib64/liblapack.so.3 matlab


--- Usage ---

Q: Is there a simple usage example?
A: Yes. See demo.m for several. Most of the code snipsets below are taken from it.

Q: After I obtain the intrinsic and extrinsic camera matrices, can I re-render the mesh using a different image size?
A: Yes. Simply edit the intrinsic matrix for the new size. e.g
    >> [~, rendered, ~, A, R, T]=renderer(300, 300, 'example.osg');
    >> new_width=610; new_height=914;
    >> A(1:2,3)=[new_width/2;new_height/2];
    >> [~, rendered_new]=renderer(new_width, new_height, 'example.osg',0,0,A,R,T);
    >> imshow(rendered_new)

Q: After I obtain the intrinsic and extrinsic camera matrices, can I post-process them (e.g. rotate/translate the model)?
A: Of-course. For example the rotation animation example from the help usage can also be performed as:
    >> [~, rendered, ~, A, R, T]=renderer(300, 300, 'example.osg');
    >> for yaw=deg2rad(0:10:360)
    >>      dcm = angle2dcm(-yaw, 0, 0);
    >>      [tmp, rendered]=renderer(300, 300, 'example.osg',0,0,A,dcm*R,T);
    >>      figure(1); imshow(rendered); pause;
    >> end

Q: I get strange calibration results when using doCalib()
A: Note that calibration must use the same width and height parameters of the original rendering. If you intend to re-render the model using  a different size it should be done after the calibration.

Q: I'm getting some strange rendering results.
A: Verify that you are using either sphere orientation (5 arguments) or camera orientation (3 arguments). They cannot be mixed.

Q: What are the values in the depth buffer? How do I find the z-value of a certain pixel?
A: The renderer returns 1 - depth (not 1/depth) of the OpenGL depth buffer. A value of 1 in OpenGL depth (meaning 0 in the depth matrix the renderer returns) corresponds to the far clipping plane, and a value of 0 (1 in the renderer depth) is the near clipping plane. However values in between are not linear (meaning a values of 0.5 does not mean it is exactly in the middle between the two clipping planes). In general it indeed corresponds to the distance from the camera. You can read more about it in OpenGL references. The renderer uses OpenSceneGraph auto-calculation of the near and far clipping planes.
You can use v_p=A*[R T']*v where [v;1] is a a vector from the returned unproject matrix. The value of v_p(3) should correspond to the z value.
 
Q: Can I view the 3D points of the model?
A: Yes. Use either
    >> surf(unproject(:,:,1),unproject(:,:,2),unproject(:,:,3));
    or
    >> plot3(unproject(:,:,1),unproject(:,:,2),unproject(:,:,3),'.');
    
Q: Can you provide a simple example of pose estimation:
A. Please look at the web page for an example. Here's another one. Assuming you are trying to fit a 2D texture/image to the 3D model:
    >> width=300; height=width;
    >> [depth, rendered, unproject, A, R, T]=renderer(width, height, 'model.wrl');
    >> texture=imresize(your_texture,[height width]);
    Next, annotate m points (landmarks) from 'texture' (2D points) into pts_2D (m by 2 matrix, each row is XY) and 'unproject' (3D points) into pts_3D (m by 3 matrix, each row is XYZ).
    >> [A,R,T]=doCalib(width,height,pts_2D,pts_3D,A,R,T);
    >> [~, rendered_new]=renderer(width, height, 'model.wrl',0,0,A,R,T);
    >> imshow(rendered_new);

Q: I have some 2D and 3D correspondences. However I'm getting unusable A,R and T matrices from doCalib() with very high values
A: Most likely the 2D points are not in the same space as the renderer image output. The image your are trying to fit (and collect 2D points from) should have the same size as the rendered image. So should be the width and height arguments (for the renderer() and doCalib() functions).
    
Q: I'm getting "Error: OGL modelview is different than OSG's. Either OGL modelview is the identity matrix or could not calculate the model transformations matrix." 
A: It is usually caused by invalid camera matrices. renderer does not accept any arbitrary A, R and T matrices. It is best to first obtain  the intrinsic and extrinsic camera matrices from renderer, post process them if needed and then supply them as arguments when re-rendering. 

Q: I have a projection matrix P=A*[R T]. I've manually decomposed it into A, R and T. However I cannot use these in renderer.
A: See the above question. Since the decomposition is not unique, it is most likely different than what renderer expects as arguments. For example A(1:2,3) should be equal to half of the image size (width and height). It is best to first obtain the intrinsic and extrinsic camera matrices from renderer, post process them if needed and then supply them as arguments when re-rendering. 

Q: The rendered image seems to be matte
A: Try switching the lighting (fifth) argument on and off.

Q: Does the renderer access the filesystem whenever I call it?
A: There is a model cache, hence repeated rendering of the same 3D model automatically uses cached data and do not involve re-loading / reading the CG file or textures.
